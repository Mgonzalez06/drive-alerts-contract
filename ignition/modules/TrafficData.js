const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");
module.exports = buildModule("TrafficDataModule", (m) => {
  const lock = m.contract("TrafficData").lock;

  return { lock };
});
