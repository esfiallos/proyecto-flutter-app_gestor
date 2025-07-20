-- ====================
-- TABLAS PRINCIPALES
-- ====================

CREATE TABLE Usuarios (
    id_usuario INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    apellido TEXT,
    correo TEXT UNIQUE,
    contraseña TEXT,
    whatsapp TEXT,
    instagram TEXT,
    imagen_perfil TEXT,
    pais TEXT,
    ubicacion TEXT
);

CREATE TABLE Categorias (
    id_categoria INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL
);

CREATE TABLE Productos (
    id_producto INTEGER PRIMARY KEY AUTOINCREMENT,
    codigo TEXT UNIQUE,
    nombre TEXT,
    precio REAL,
    stock INTEGER,
    costo REAL,
    descripcion TEXT,
    fecha_vencimiento TEXT,
    imagen_src TEXT,
    metodo_pago TEXT,
    id_categoria INTEGER,
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);

CREATE TABLE Ventas (
    id_venta INTEGER PRIMARY KEY AUTOINCREMENT,
    tipo_venta TEXT CHECK(tipo_venta IN ('libre', 'productos')),
    fecha TEXT DEFAULT CURRENT_DATE,
    concepto TEXT,
    metodo_pago TEXT
);

CREATE TABLE DetalleVenta (
    id_detalle INTEGER PRIMARY KEY AUTOINCREMENT,
    id_venta INTEGER,
    id_producto INTEGER,
    cantidad INTEGER,
    FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

CREATE TABLE Gastos (
    id_gasto INTEGER PRIMARY KEY AUTOINCREMENT,
    fecha TEXT DEFAULT CURRENT_DATE,
    valor REAL,
    metodo_pago TEXT,
    concepto TEXT,
    id_producto INTEGER,
    cantidad INTEGER,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

-- ====================
-- TRIGGERS INVENTARIO
-- ====================

CREATE TRIGGER descontar_stock AFTER INSERT ON DetalleVenta
BEGIN
    UPDATE Productos
    SET stock = stock - NEW.cantidad
    WHERE id_producto = NEW.id_producto;
END;

CREATE TRIGGER reponer_stock AFTER INSERT ON Gastos
WHEN NEW.id_producto IS NOT NULL
BEGIN
    UPDATE Productos
    SET stock = stock + NEW.cantidad
    WHERE id_producto = NEW.id_producto;
END;

-- ====================
-- VIEWS
-- ====================

CREATE VIEW View_BalanceGeneral AS
SELECT
    IFNULL((
        SELECT SUM(p.precio * dv.cantidad)
        FROM DetalleVenta dv
        JOIN Productos p ON dv.id_producto = p.id_producto
    ), 0) AS total_ingresos,
    IFNULL((SELECT SUM(valor) FROM Gastos), 0) AS total_egresos,
    (
        IFNULL((
            SELECT SUM(p.precio * dv.cantidad)
            FROM DetalleVenta dv
            JOIN Productos p ON dv.id_producto = p.id_producto
        ), 0) -
        IFNULL((SELECT SUM(valor) FROM Gastos), 0)
    ) AS balance;

CREATE VIEW View_VentasPorMetodoPago AS
SELECT metodo_pago,
       COUNT(*) AS cantidad_ventas,
       SUM(p.precio * dv.cantidad) AS total
FROM Ventas v
JOIN DetalleVenta dv ON v.id_venta = dv.id_venta
JOIN Productos p ON dv.id_producto = p.id_producto
GROUP BY metodo_pago;

CREATE VIEW View_EgresosPorMetodoPago AS
SELECT metodo_pago,
       COUNT(*) AS cantidad_gastos,
       SUM(valor) AS total
FROM Gastos
GROUP BY metodo_pago;

CREATE VIEW View_ProductoMasVendido AS
SELECT p.nombre, SUM(dv.cantidad) AS total_vendido
FROM DetalleVenta dv
JOIN Productos p ON dv.id_producto = p.id_producto
GROUP BY dv.id_producto
ORDER BY total_vendido DESC
LIMIT 1;

CREATE VIEW View_ProductosMasVendidosPorMes AS
SELECT 
    strftime('%Y-%m', v.fecha) AS mes,
    p.nombre,
    SUM(dv.cantidad) AS cantidad_total
FROM DetalleVenta dv
JOIN Ventas v ON dv.id_venta = v.id_venta
JOIN Productos p ON dv.id_producto = p.id_producto
GROUP BY mes, p.nombre
ORDER BY mes, cantidad_total DESC;

CREATE VIEW View_ProductosMenosVendidosPorMes AS
SELECT 
    strftime('%Y-%m', v.fecha) AS mes,
    p.nombre,
    SUM(dv.cantidad) AS cantidad_total
FROM DetalleVenta dv
JOIN Ventas v ON dv.id_venta = v.id_venta
JOIN Productos p ON dv.id_producto = p.id_producto
GROUP BY mes, p.nombre
ORDER BY mes, cantidad_total ASC;

CREATE VIEW View_MetodoPagoMasUsado AS
SELECT metodo_pago, COUNT(*) AS total_usos
FROM Ventas
GROUP BY metodo_pago
ORDER BY total_usos DESC
LIMIT 1;

CREATE VIEW View_StockProductos AS
SELECT nombre, stock, precio, costo
FROM Productos
ORDER BY stock ASC;
