const connection = require("../connection");
const Sequelize = require("sequelize");

const Model = Sequelize.Model;

class Datapoints extends Model {}

Datapoints.init(
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
        modelName: "datapoints",
    }
);

module.exports = Datapoints;