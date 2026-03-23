// Use the database
use("ecommerce_catalog");

// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
  {
    _id: "P1001",
    name: "Samsung 55-inch 4K Smart TV",
    category: "Electronics",
    brand: "Samsung",
    price: 45999,
    stock: 15,
    specifications: {
      warranty_years: 2,
      voltage: "220V",
      screen_size: "55 inches",
      resolution: "4K UHD"
    },
    features: ["Smart TV", "WiFi", "HDR", "Voice Control"],
    seller: {
      seller_id: "S201",
      seller_name: "ElectroWorld"
    }
  },
  {
    _id: "P1002",
    name: "Men's Cotton Casual Shirt",
    category: "Clothing",
    brand: "Allen Solly",
    price: 1499,
    stock: 40,
    attributes: {
      size: ["M", "L", "XL"],
      color: "Blue",
      material: "Cotton",
      fit: "Regular"
    },
    care_instructions: ["Machine wash", "Do not bleach"],
    seller: {
      seller_id: "S202",
      seller_name: "FashionHub"
    }
  },
  {
    _id: "P1003",
    name: "Organic Full Cream Milk 1L",
    category: "Groceries",
    brand: "Amul",
    price: 68,
    stock: 120,
    expiry_date: new Date("2024-12-20"),
    nutritional_info: {
      calories: 62,
      protein_g: 3.2,
      fat_g: 3.5,
      calcium_mg: 120
    },
    storage: {
      temperature: "Keep refrigerated",
      shelf_life_days: 7
    },
    tags: ["Dairy", "Fresh", "Organic"]
  }
]);


// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});


// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});


// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
  { _id: "P1001" },
  { $set: { discount_percent: 10 } }
);


// OP5: createIndex() — create an index on category field and explain why
db.products.createIndex({ category: 1 });

// Why:
// Creating an index on the category field improves query performance
// because products are frequently searched by category such as
// Electronics, Clothing, and Groceries. The index reduces scan time
// and makes category-based retrieval faster.