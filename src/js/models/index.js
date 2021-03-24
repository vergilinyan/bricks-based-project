const Dataset = require("./dataset");
const Metadata = require("./metadata");

Dataset.belongsTo(Metadata, {
    foreignKey: "dataset_id"
});

module.exports = {
    Dataset,
    Metadata
};