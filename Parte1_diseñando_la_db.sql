CREATE TABLE
    Categoria (id INT PRIMARY KEY, nombre VARCHAR(255))
;

CREATE TABLE
    Producto (
        id INT PRIMARY KEY,
        nombre VARCHAR(255),
        marca VARCHAR(255),
        categoria_id INT,
        precio_unitario DECIMAL(10, 2),
        FOREIGN KEY (categoria_id) REFERENCES Categoria (id)
    )
;

CREATE TABLE
    Sucursal (
        id INT PRIMARY KEY,
        nombre VARCHAR(255),
        direccion VARCHAR(255)
    )
;

CREATE TABLE
    Stock (
        id INT PRIMARY KEY,
        sucursal_id INT,
        producto_id INT,
        cantidad INT,
        UNIQUE (sucursal_id, producto_id),
        FOREIGN KEY (sucursal_id) REFERENCES Sucursal (id),
        FOREIGN KEY (producto_id) REFERENCES Producto (id)
    )
;

CREATE UNIQUE INDEX unique_stock ON Stock (sucursal_id, producto_id)
;

CREATE TABLE
    Cliente (
        id INT PRIMARY KEY,
        nombre VARCHAR(255),
        telefono VARCHAR(20)
    )
;

CREATE TABLE
    Orden (
        id INT PRIMARY KEY,
        cliente_id INT,
        sucursal_id INT,
        fecha DATE,
        total DECIMAL(10, 2),
        FOREIGN KEY (cliente_id) REFERENCES Cliente (id),
        FOREIGN KEY (sucursal_id) REFERENCES Sucursal (id)
    )
;

CREATE TABLE
    Item (
        id INT PRIMARY KEY,
        orden_id INT,
        producto_id INT,
        cantidad INT,
        monto_venta DECIMAL(10, 2),
        FOREIGN KEY (orden_id) REFERENCES Orden (id),
        FOREIGN KEY (producto_id) REFERENCES Producto (id)
    )
;