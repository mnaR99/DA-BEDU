# Sesión 07: Configuración de Bases de Datos Locales

CREATE TABLE IF NOT EXISTS users (
  id_user INT PRIMARY KEY,
  sex CHAR(1),
  age INT,
  occupation INT,
  zip_code VARCHAR(100)
);

# Reto 1
# 1. Definir los campos y tipos de datos para la tabla `movies` haciendo uso de los archivos `movies.dat` y `README`. 
# 2. Crear la tabla `movies` (recuerda usar el mismo nombre del archivo sin la extensión para vincular nombres de tablas con archivos).
# 3. Definir los campos y tipos de datos para la tabla `ratings` haciendo uso de los archivos `ratings.dat` y `README`.
# 4. Crear la tabla ratings (recuerda usar el mismo nombre del archivo sin la extensión para vincular nombres de tablas con archivos)

CREATE TABLE IF NOT EXISTS movies (
  id_movie INT PRIMARY KEY,
  title_year VARCHAR(100),
  genre VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS ratings (
  id_user INT,
  id_movie INT,
  rating INT,
  time_stamp BIGINT
);
