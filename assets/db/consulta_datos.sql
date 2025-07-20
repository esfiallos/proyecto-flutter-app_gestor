INSERT INTO Usuarios (nombre, apellido, correo, contraseña, whatsapp, instagram, imagen_perfil, pais, ubicacion)
VALUES 
('Ana', 'Martínez', 'ana.martinez@email.com', '12345678', '50498765432', '@anita.market', NULL, 'Honduras', 'Tegucigalpa');


INSERT INTO Categorias (nombre)
VALUES 
('Bebidas'),
('Snacks'),
('Limpieza');


INSERT INTO Productos (codigo, nombre, precio, stock, costo, descripcion, fecha_vencimiento, imagen_src, metodo_pago, id_categoria)
VALUES
('BEB001', 'Coca Cola 500ml', 20.0, 50, 12.0, 'Refresco gaseoso', '2025-06-01', NULL, 'efectivo', 1),
('SNK001', 'Papas Lays Clásicas', 15.0, 35, 9.0, 'Snack salado', '2025-12-01', NULL, 'efectivo', 2),
('LMP001', 'Jabón líquido', 40.0, 20, 25.0, 'Jabón multiuso', NULL, NULL, 'tarjeta', 3);


INSERT INTO Ventas (tipo_venta, fecha, concepto, metodo_pago)
VALUES 
('productos', '2025-07-19', 'Venta en mostrador', 'efectivo'),
('libre', '2025-07-19', 'Venta sin productos (servicio)', 'transferencia');

INSERT INTO DetalleVenta (id_venta, id_producto, cantidad)
VALUES 
(1, 1, 2),
(1, 2, 1);

-- Compra de más Coca-Cola (agrega stock)
INSERT INTO Gastos (fecha, valor, metodo_pago, concepto, id_producto, cantidad)
VALUES 
('2025-07-18', 120.0, 'efectivo', 'Compra de refrescos', 1, 10);

-- Gasto de operación sin producto asociado
INSERT INTO Gastos (fecha, valor, metodo_pago, concepto, id_producto, cantidad)
VALUES 
('2025-07-18', 300.0, 'tarjeta', 'Pago de luz', NULL, NULL);


