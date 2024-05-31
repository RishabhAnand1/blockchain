//Question for the PatientRecords.sol is stored in the PatientRecord.txt file in "https://github.com/RishabhAnand1/blockchain/codes/Questions/PatientRecords.txt"


// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;
contract PatientRecords {
    // Arrays to store patient details
    uint[] public ids;
    string[] public names;
    uint[] public ages;
    string[] public genders;
    string[] public medicalHistories;

    // Mapping to track the index of patient IDs
    mapping(uint => uint) public idToIndex;

    // Function to add a new patient record
    function addPatient(uint _id, string memory _name, uint _age, string memory _gender, string memory _medicalHistory) public returns (bool success) {
        // Check if the ID is already used
        require(idToIndex[_id] == 0, "Patient ID already exists");

        // Add patient details to arrays
        ids.push(_id);
        names.push(_name);
        ages.push(_age);
        genders.push(_gender);
        medicalHistories.push(_medicalHistory);

        // Update mapping with the index of the new patient ID
        idToIndex[_id] = ids.length;

        return true;
    }

    // Getter function to retrieve a patient's information
    function getPatient(uint _id) public view returns (uint id, string memory name, uint age, string memory gender, string memory medicalHistory) {
        // Ensure the patient exists
        uint index = idToIndex[_id];
        require(index != 0, "Patient not found");

        // Retrieve patient details using the index
        return (ids[index - 1], names[index - 1], ages[index - 1], genders[index - 1], medicalHistories[index - 1]);
    }

    // Function to get the total number of patients stored
    function getPatientCount() public view returns (uint) {
        return ids.length;
    }
}
