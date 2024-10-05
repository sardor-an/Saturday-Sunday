from db import Base, engine
from sqlalchemy import Integer, Column, Boolean, String, Text, ForeignKey
from sqlalchemy.orm import relationship
from sqlalchemy_utils import ChoiceType

class User(Base):
    __tablename__ = 'user'
    id = Column(Integer, primary_key=True)
    username = Column(String(25), unique=True)
    email = Column(String(40), unique=True)
    password = Column(Text)
    is_staff = Column(Boolean, default=False)
    is_active = Column(Boolean, default=False)
    orders = relationship('Order', back_populates='user_id')


class Order(Base):
    STATUSES = (
        ('PENDING', 'pending'),
        ('IN-TRANZIT', 'in-tranzit'),
        ('DELIVERED', 'delivered')
    )

    __tablename__ = 'order'
    id = Column(Integer, primary_key=True)
    quantity = Column(Integer, nullable=False)
    order_status = Column(ChoiceType(STATUSES), default='PENDING')
    user = Column(Integer, ForeignKey('users.id'))
    user = relationship("User", back_populates='orders')
    product_id = Column(Integer, ForeignKey('product.id'))
    product = relationship('Product', back_populates='orders')


class Product(Base):
    __tablename__ = 'product'
    id = Column(Integer, primary_key=True)
    name = Column(Text)
    price = Column(Integer)
    # orders = relationship('Order', back_populates='product')

Base.metadata.create_all(bind=engine)