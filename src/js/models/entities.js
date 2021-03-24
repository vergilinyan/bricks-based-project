const connection = require("../connection");
const Sequelize = require("sequelize");

const Model = Sequelize.Model;

class Entities extends Model {}

Entities.init(
    {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            allowNull: false,
            unique: true
        },
        dataset_id: {
            type: Sequelize.INTEGER,
            allowNull: false
        },
        name: {
            type: Sequelize.STRING,
            allowNull: false
        }
    },
    {
        sequelize: connection,
        modelName: "entities",
    }
);

module.exports = Entities;