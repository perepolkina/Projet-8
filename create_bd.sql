
CREATE TABLE public.Ingredient (
                ingredient_id INTEGER NOT NULL,
                name_ingredient VARCHAR(255) NOT NULL,
                dimension VARCHAR(255) NOT NULL,
                CONSTRAINT ingredient_pk PRIMARY KEY (ingredient_id)
);


CREATE TABLE public.Article (
                article_id INTEGER NOT NULL,
                name_article VARCHAR(255) NOT NULL,
                price INTEGER NOT NULL,
                CONSTRAINT article_pk PRIMARY KEY (article_id)
);


CREATE TABLE public.IngredientComposition (
                article_id INTEGER NOT NULL,
                ingredient_id INTEGER NOT NULL,
                quantity INTEGER NOT NULL,
                CONSTRAINT ingredientcomposition_pk PRIMARY KEY (article_id, ingredient_id)
);


CREATE TABLE public.Address (
                address_id INTEGER NOT NULL,
                postal_code VARCHAR(255) NOT NULL,
                city VARCHAR(255) NOT NULL,
                address VARCHAR(255) NOT NULL,
                CONSTRAINT address_pk PRIMARY KEY (address_id)
);


CREATE TABLE public.Pizzeria (
                pizzeria_id INTEGER NOT NULL,
                address_id INTEGER NOT NULL,
                CONSTRAINT pizzeria_pk PRIMARY KEY (pizzeria_id)
);


CREATE TABLE public.Stock (
                pizzeria_id INTEGER NOT NULL,
                ingredient_id INTEGER NOT NULL,
                quantity INTEGER NOT NULL,
                CONSTRAINT stock_pk PRIMARY KEY (pizzeria_id, ingredient_id)
);


CREATE TABLE public.User (
                user_id INTEGER NOT NULL,
                mail VARCHAR(255) NOT NULL,
                login VARCHAR(255) NOT NULL,
                password VARCHAR(255) NOT NULL,
                phone_number VARCHAR(255) NOT NULL,
                role VARCHAR(255) NOT NULL,
                address_id INTEGER NOT NULL,
                CONSTRAINT user_pk PRIMARY KEY (user_id)
);


CREATE TABLE public.Employee (
                employee_id INTEGER NOT NULL,
                pizzeria_id INTEGER NOT NULL,
                CONSTRAINT employee_pk PRIMARY KEY (employee_id)
);


CREATE TABLE public.Order (
                order_id INTEGER NOT NULL,
                pizzeria_id INTEGER NOT NULL,
                order_date TIMESTAMP NOT NULL,
                client_id INTEGER NOT NULL,
                employee_id INTEGER NOT NULL,
                price_total INTEGER NOT NULL,
                paid BOOLEAN NOT NULL,
                status VARCHAR(255) NOT NULL,
                CONSTRAINT order_pk PRIMARY KEY (order_id)
);


CREATE TABLE public.OrderComposition (
                order_id INTEGER NOT NULL,
                article_id INTEGER NOT NULL,
                amount INTEGER NOT NULL,
                CONSTRAINT ordercomposition_pk PRIMARY KEY (order_id, article_id)
);


ALTER TABLE public.IngredientComposition ADD CONSTRAINT ingredient_ingredientcomposition_fk
FOREIGN KEY (ingredient_id)
REFERENCES public.Ingredient (ingredient_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Stock ADD CONSTRAINT ingredient_stock_fk
FOREIGN KEY (ingredient_id)
REFERENCES public.Ingredient (ingredient_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.OrderComposition ADD CONSTRAINT article_ordercomposition_fk
FOREIGN KEY (article_id)
REFERENCES public.Article (article_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.IngredientComposition ADD CONSTRAINT article_ingredientcomposition_fk
FOREIGN KEY (article_id)
REFERENCES public.Article (article_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Pizzeria ADD CONSTRAINT address_pizzeria_fk
FOREIGN KEY (address_id)
REFERENCES public.Address (address_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.User ADD CONSTRAINT address_user_fk
FOREIGN KEY (address_id)
REFERENCES public.Address (address_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Employee ADD CONSTRAINT pizzeria_employee_fk
FOREIGN KEY (pizzeria_id)
REFERENCES public.Pizzeria (pizzeria_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Order ADD CONSTRAINT pizzeria_order_fk
FOREIGN KEY (pizzeria_id)
REFERENCES public.Pizzeria (pizzeria_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Stock ADD CONSTRAINT pizzeria_stock_fk
FOREIGN KEY (pizzeria_id)
REFERENCES public.Pizzeria (pizzeria_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Employee ADD CONSTRAINT user_empoyee_fk
FOREIGN KEY (employee_id)
REFERENCES public.User (user_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Order ADD CONSTRAINT user_order_fk
FOREIGN KEY (client_id)
REFERENCES public.User (user_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Order ADD CONSTRAINT empoyee_order_fk
FOREIGN KEY (employee_id)
REFERENCES public.Employee (employee_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.OrderComposition ADD CONSTRAINT order_ordercomposition_fk
FOREIGN KEY (order_id)
REFERENCES public.Order (order_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
