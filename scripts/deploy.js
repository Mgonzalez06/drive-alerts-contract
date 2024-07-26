async function main() {
  const TrafficData = await ethers.getContractFactory("TrafficData");
  const trafficData = await TrafficData.deploy();
  await trafficData.deployed();

  console.log("TrafficData deployed to:", trafficData.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
