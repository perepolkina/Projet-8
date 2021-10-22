SELECT * FROM public.article
ORDER BY article_id ASC 

INSERT INTO public.article(
	article_id, name_article, price)
	VALUES (2,'4 fromage' , 12),
	(3, 'Papperoni' , 9),
	(4,'4 Barbecue' , 12);

UPDATE public.article
	SET name_article='Barbecue'
	WHERE article_id=4;


INSERT INTO public.address(
	address_id, postal_code, city, address)
	VALUES (1, '92400', 'Courbevoi', '8 Bd Georges Clemenceau'),
		(2, '75012', 'Paris', 'Pl. de la Bastille'),
		(3, '75002', 'Paris', '1 Pl. Boieldieu'),
		(4, '75012', 'Paris', '37 Rue de Maubeuge,'),
		(5, '75009', 'Paris', '37 Rue de Maubeuge');

SELECT address_id, postal_code, city, address
	FROM public.address;

DELETE FROM public.address
	WHERE address_id= 5;

INSERT INTO public.pizzeria(
	pizzeria_id, address_id)
	VALUES (1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 4);

SELECT pizzeria_id, address_id
	FROM public.pizzeria;

INSERT INTO public."user"(
	user_id, mail, login, password, phone_number, role, address_id)
	VALUES (1, '111@gmail','Tom', '1234', '0711111111', 'employee', 1),
	(2, '222@gmail','Paul', '3245', '071111222', 'employee', 1),
	(3, 'love@gmail','Sophie', '656', '071236311', 'employee', 1),
	(4, '123@gmail','Steph', 'time', '072222222','employee', 2),
	(5, 'city1@gmail','bond007', 'note123', '071156621', 'employee', 3),
	(6, 'hate@gmail','Maria','23342','07114336611','client', 4);

SELECT user_id, mail, login, password, phone_number, role, address_id
	FROM public."user";


UPDATE public."user"
	SET phone_number= '071143222'
	WHERE user_id = 6;

SELECT user_id, mail, login, password, phone_number, role, address_id
	FROM public."user";

INSERT INTO public.employee(
	employee_id, pizzeria_id)
	VALUES (1, 1),
			(2, 1),
			(3, 1),
			(4, 2),
			(5, 3);

SELECT *
	FROM public.employee;

INSERT INTO public.ingredient(
	ingredient_id, name_ingredient, dimension)
	VALUES (1, 'mozzarella', 'grammes'),
	(2, 'jambon', 'grammes'),
	(3, 'champignons', 'grammes'),
	(4, 'saucisse', 'grammes'),
	(5, 'poivrons verts', 'grammes'),
	(6, 'oignons rouges', 'grammes');

SELECT ingredient_id, name_ingredient, dimension
	FROM public.ingredient;

INSERT INTO public.ingredientcomposition(
	article_id, ingredient_id, quantity)
	VALUES (4, 1, 50),
	(4, 2, 30),24
	(4, 5, 20),
	(1, 6, 10);

SELECT  ingredient_id, quantity
	FROM public.ingredientcomposition;

UPDATE public.ingredientcomposition
	SET  quantity= 50 
	WHERE ingredient_id = 2;

INSERT INTO public.stock(
	pizzeria_id, ingredient_id, quantity)
	VALUES (1, 1, 1000),
			(1, 2, 500),
			(3, 1, 1200),
			(3, 5, 5000);

SELECT ingredient_id
	FROM public.stock;

INSERT INTO public."order"(
	order_id, pizzeria_id, order_date, client_id, employee_id, price_total, paid, status)
	VALUES (1, 1, '2021-09-21', 5, 2, 24, true, 'livrée'),
			(2, 1, '2021-09-21', 5, 2, 12, true, 'en cour de préparation'),
			(3, 2, '2021-09-21', 5, 4, 9, true, 'préparée'),
			(4, 3, '2021-09-21', 5, 5, 21, true, 'livraison en cours');


SELECT order_id,  order_date, status
	FROM public."order";

DELETE FROM public."order"
	WHERE status = 'livraison en cours';

INSERT INTO public.ordercomposition(
	order_id, article_id, amount)
	VALUES (1, 2, 1),
			(1, 4, 1);

SELECT order_id, article_id, amount
	FROM public.ordercomposition;