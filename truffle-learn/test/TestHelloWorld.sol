import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/HelloWorld.sol";

contract TestHelloWorld {

  function testAMulToB() public {
    HelloWorld math = HelloWorld(DeployedAddresses.HelloWorld());
    Assert.equal(math.mulAToB(2,3),6,"2*3 == 6");
  }
}
