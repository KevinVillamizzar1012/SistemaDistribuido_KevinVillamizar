-- =====================================================================
-- SCRIPT DE CREACIÓN DE BASE DE DATOS PARA SISTEMA DISTRIBUIDO
-- Proyecto: Gestión de inventarios con ActiveMQ
-- =====================================================================

CREATE DATABASE IF NOT EXISTS distribuidora_db;
USE distribuidora_db;

-- 1. Tabla Sucursales
CREATE TABLE Sucursales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    telefono VARCHAR(20) NOT NULL
);

-- 2. Tabla Productos
CREATE TABLE Productos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL
);

-- 3. Tabla Movimientos (Registro de transacciones)
CREATE TABLE Movimientos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_sucursal INT,
    id_producto INT,
    tipo VARCHAR(20), -- 'COMPRA' o 'VENTA'
    cantidad INT,
    precio_unitario DECIMAL(10,2),
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_sucursal) REFERENCES Sucursales(id),
    FOREIGN KEY (id_producto) REFERENCES Productos(id)
);

-- 4. Inserción de datos de prueba (Obligatorio para que las llaves foráneas funcionen)
INSERT INTO Sucursales (nombre, direccion, telefono) VALUES 
('Sede Central', 'Calle 100 # 15-20', '6012345678'),
('Sucursal Norte', 'Av. 19 # 120-45', '6018765432');

INSERT INTO Productos (nombre, descripcion, precio) VALUES 
('Arroz 1kg', 'Arroz blanco de primera calidad', 3500.00),
('Leche 1L', 'Leche entera pasteurizada', 4200.00);