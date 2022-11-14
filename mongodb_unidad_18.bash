# 1- crear una base de datos
use products

# 2- crear dos colecciones
db.createCollection("productsA")
db.createCollection("productsB")

# 3- insertar 1 documento
db.productsA.insertOne({Name: "Akshay", Marks: 500})

# 4- insertar varios documentos
db.productsB.insert([
    {
        nombre: "HDD Seagate",
        cantidad: 45,
        precio: 79.99,
        tipo: "HDD"
    },
    {
        nombre: "HDD Maxtor",
        cantidad: 20,
        precio: 65.50,
        tipo: "HDD"
    }
])  

# 5- Listar los documentos existentes en una colección
db.productsB.find()

# 6- Listar un documento específico dentro de la colección
# busca el documentos cuyo "nombre" sea igual a "HDD Seagate"
db.productsB.find({nombre: "HDD Seagate",
        cantidad: 45,})

# 7- Realizar un update en un registro
# se busca el registro con el id "637261a1d37367570c4d329f" y
# se actualizan los campos "cantidad" y "precio"
db.productsB.update({
    _id: ObjectId("637261a1d37367570c4d329f")
},
{
    $set: {
        cantidad: 35,
        precio: 60
    }
})

# 8- Realizar un update a varios registros de forma simultánea
# busca todos los documentos que tengan "HDD" en el campo "tipo"
# luego cambia "cantidad" a "10"
# modifica todas las coincidencias
db.productsB.update({tipo:"HDD"},{$set:{cantidad:10}},{multi:true})
