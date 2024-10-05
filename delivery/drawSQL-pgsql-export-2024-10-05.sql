CREATE TABLE "product"(
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "price" BIGINT NOT NULL
);
ALTER TABLE
    "product" ADD PRIMARY KEY("id");
CREATE TABLE "user"(
    "id" INTEGER NOT NULL,
    "username" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "is_staff" BOOLEAN NOT NULL,
    "is_active" BOOLEAN NOT NULL
);
ALTER TABLE
    "user" ADD PRIMARY KEY("id");
ALTER TABLE
    "user" ADD CONSTRAINT "user_email_unique" UNIQUE("email");
CREATE TABLE "status"(
    "id" INTEGER NOT NULL,
    "pending" TEXT NOT NULL,
    "in_tranzit" TEXT NOT NULL,
    "deliveried" TEXT NOT NULL
);
ALTER TABLE
    "status" ADD PRIMARY KEY("id");
ALTER TABLE
    "status" ADD CONSTRAINT "status_pending_unique" UNIQUE("pending");
ALTER TABLE
    "status" ADD CONSTRAINT "status_in_tranzit_unique" UNIQUE("in_tranzit");
ALTER TABLE
    "status" ADD CONSTRAINT "status_deliveried_unique" UNIQUE("deliveried");
CREATE TABLE "order"(
    "id" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,
    "status" TEXT NOT NULL,
    "price" BIGINT NOT NULL,
    "user_id" INTEGER NOT NULL,
    "product_id" INTEGER NOT NULL
);
ALTER TABLE
    "order" ADD PRIMARY KEY("id");
ALTER TABLE
    "order" ADD CONSTRAINT "order_product_id_foreign" FOREIGN KEY("product_id") REFERENCES "product"("id");
ALTER TABLE
    "order" ADD CONSTRAINT "order_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "user"("id");