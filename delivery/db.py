from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base


engine = create_engine('postgresql://postgres:202412last@localhost/delivery', echo=True)

Base = declarative_base()

session = sessionmaker()