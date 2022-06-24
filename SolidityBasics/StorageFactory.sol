//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
import "./SimpleStorage.sol";

contract StorageFactory {
    //An array of contracts
    SimpleStorage[] public storageArray;

    //Keep track of the length of the the Array, to not cause indexing errors.
    uint256 public lengthOfStorageArray;
    
    //function generates new simpleStorage contract.
    function generateSimpleStorage() internal returns(SimpleStorage){
        SimpleStorage newSimpleStorage = new SimpleStorage();
        return newSimpleStorage;
    }

    //function calls previous function and appends the result to the storageArray
    function addToStorageArray() public{
        storageArray.push(generateSimpleStorage());
        lengthOfStorageArray++;
    }

    //Self explanitory, lookup a contract's address using the _index argument
    function lookupContractByIndex(uint256 _index) public view returns(SimpleStorage){
        return storageArray[_index];
    }

}
