
create database ShoesStore
use ShoesStore
create table Account(
    Username nvarchar(20) primary key not null,
	Password nvarchar(30) not null,
	Fullname nvarchar(30) not null,
    IsAdmin bit,
    Active bit
)

CREATE TABLE Category (
   CategoryId INT PRIMARY KEY IDENTITY(1,1),
   CategoryName NVARCHAR(50) NOT NULL
);

CREATE TABLE Product (
   ProductId INT PRIMARY KEY IDENTITY(1,1),
   ProductName NVARCHAR(50) NOT NULL,
   Price float NOT NULL,
   Description NVARCHAR(200) NOT NULL,
   img nvarchar(1000) NOT NULL,
   CategoryId INT NOT NULL FOREIGN KEY REFERENCES Category(CategoryId)
);
CREATE TABLE [Order] (
   OrderId INT PRIMARY KEY IDENTITY(1,1),
   Username nvarchar(20) NOT NULL FOREIGN KEY REFERENCES Account(Username),
   OrderDate DATE NOT NULL,
   Total float NOT NULL
);

create TABLE OrderDetail (
   OrderDetailId INT PRIMARY KEY IDENTITY(1,1),
   OrderId INT FOREIGN KEY REFERENCES [Order](OrderId),
   ProductId INT NOT NULL FOREIGN KEY REFERENCES Product(ProductId),
   Quantity INT NOT NULL,
   Price float NOT NULL
);
SELECT * FROM Account where IsAdmin != 1
INSERT INTO Account(Username , Password, Fullname, IsAdmin, Active)
VALUES('admin', 'admin', 'I am Admin', 1, 1)

GO
INSERT INTO Category(CategoryName)
VALUES('ADIDAS'),('NIKE'),('BALENCIAGA')
GO
INSERT INTO Product (
   ProductName,
   Price,
   Description,
   img,
   CategoryId
) VALUES
('Samba OG Shoes', 100, 'This product is excluded from all promotional discounts and offers.', 'https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/612e04479ff1445b99b051d7e05b581f_9366/Samba_OG_Shoes_Green_IE7011_01_standard.jpg', 1),
('SAMBAE SHOES', 110, 'This product is excluded from all promotional discounts and offers.', 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/765504fa6ec249e8bc76690a6c02a187_9366/Sambae_Shoes_White_ID0440_01_standard.jpg', 1),
('Nike G.T. Cut 2 (Team)', 144.97, 'Mens Basketball Shoes', 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/5e633cbc-b783-4da4-8ee2-4b77a62909a0/gt-cut-2-team-mens-basketball-shoes-B1VfPf.png', 2),
('Nike G.T. Cut 2', 144.97, 'Men Basketball Shoes', 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/522182fc-3ed6-4567-8728-0f63fc3168f8/gt-cut-2-mens-basketball-shoes-tmfmFl.png', 2),
('MEN ROMEO MULE IN BLACK', 1000, 'Romeo Mule in black calfskin is in several looks of Balenciaga Spring 24 Collection.', 'https://balenciaga.dam.kering.com/m/1e387863d3b93/Medium-769603WBAW11000_F.jpg?v=2', 3),
('MEN 3XL SNEAKER IN BLACK', 1150, '3XL Sneaker in black, orange and grey mesh and polyurethane', 'https://balenciaga.dam.kering.com/m/2c34441a6704a411/Medium-734734W3XL31178_F.jpg?v=2', 3)