PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

echo $($PSQL "ALTER TABLE properties RENAME COLUMN weight TO atomic_mass;")
echo $($PSQL "ALTER TABLE properties RENAME COLUMN melting_point TO melting_point_celsius;")
echo $($PSQL "ALTER TABLE properties RENAME COLUMN boiling_point TO boiling_point_celsius;")
echo $($PSQL "ALTER TABLE properties ALTER COLUMN melting_point_celsius SET NOT NULL, ALTER COLUMN boiling_point_celsius SET NOT NULL;")
echo $($PSQL "ALTER TABLE elements ADD CONSTRAINT unique_symbols_elements UNIQUE (symbol, name);")
echo $($PSQL "ALTER TABLE elements ALTER COLUMN symbol SET NOT NULL, ALTER COLUMN name SET NOT NULL;")
echo $($PSQL "ALTER TABLE properties ADD FOREIGN KEY (atomic_number) REFERENCES elements(atomic_number);")
echo $($PSQL "UPDATE elements SET symbol = INITCAP(symbol);")
echo $($PSQL "ALTER TABLE properties ALTER COLUMN atomic_mass SET DATA TYPE DECIMAL;")
echo $($PSQL "UPDATE properties SET atomic_mass = atomic_mass::REAL;")
echo $($PSQL "CREATE TABLE types(type_id INT PRIMARY KEY, type VARCHAR(60) NOT NULL);")

echo $($PSQL "TRUNCATE properties, elements;")
# fill types table
echo $($PSQL "INSERT INTO types(type_id, type) VALUES(1, 'nonmetal');")
echo $($PSQL "INSERT INTO types(type_id, type) VALUES(2, 'metal');")
echo $($PSQL "INSERT INTO types(type_id, type) VALUES(3, 'metalloid');")
echo $($PSQL "ALTER TABLE properties ADD COLUMN type_id INT;")
echo $($PSQL "ALTER TABLE properties ADD FOREIGN KEY (type_id) REFERENCES types(type_id);")
# refill elements table
echo $($PSQL "INSERT INTO elements(atomic_number, symbol, name) VALUES(1, 'H', 'Hydrogen');")
echo $($PSQL "INSERT INTO elements(atomic_number, symbol, name) VALUES(2, 'He', 'Helium');")
echo $($PSQL "INSERT INTO elements(atomic_number, symbol, name) VALUES(3, 'Li', 'Lithium');")
echo $($PSQL "INSERT INTO elements(atomic_number, symbol, name) VALUES(4, 'Be', 'Beryllium');")
echo $($PSQL "INSERT INTO elements(atomic_number, symbol, name) VALUES(5, 'B', 'Boron');")
echo $($PSQL "INSERT INTO elements(atomic_number, symbol, name) VALUES(6, 'C', 'Carbon');")
echo $($PSQL "INSERT INTO elements(atomic_number, symbol, name) VALUES(7, 'N', 'Nitrogen');")
echo $($PSQL "INSERT INTO elements(atomic_number, symbol, name) VALUES(8, 'O', 'Oxygen');")
echo $($PSQL "INSERT INTO elements(atomic_number, symbol, name) VALUES(9, 'F', 'Fluorine');")
echo $($PSQL "INSERT INTO elements(atomic_number, symbol, name) VALUES(10, 'Ne', 'Neon');")
# refill properties table
echo $($PSQL "INSERT INTO properties(atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES(1, 'nonmetal', 1.008, -259.1, -252.9, 1);")
echo $($PSQL "INSERT INTO properties(atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES(2, 'nonmetal', 4.0026, -272.2, -269, 1);")
echo $($PSQL "INSERT INTO properties(atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES(3, 'metal', 6.94, 180.54, 1342, 2);")
echo $($PSQL "INSERT INTO properties(atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES(4, 'metal', 9.0122, 1287, 2470, 2);")
echo $($PSQL "INSERT INTO properties(atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES(5, 'metaloid', 10.81, 2075, 4000, 3);")
echo $($PSQL "INSERT INTO properties(atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES(6, 'nonmetal', 12.011, 3550, 4027, 1);")
echo $($PSQL "INSERT INTO properties(atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES(7, 'nonmetal', 14.007, -210.1, -195.8, 1);")
echo $($PSQL "INSERT INTO properties(atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES(8, 'nonmetal', 15.999, -218, -183, 1);")
echo $($PSQL "INSERT INTO properties(atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES(9, 'nonmetal', 18.998, -220, -188.1, 1);")
echo $($PSQL "INSERT INTO properties(atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES(10, 'nonmetal', 20.18, -248.6, -246.1, 1);")

echo $($PSQL "ALTER TABLE properties ALTER COLUMN type_id SET NOT NULL;")
echo $($PSQL "ALTER TABLE properties DROP COLUMN type;")


