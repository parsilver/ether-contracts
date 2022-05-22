//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface ERC20 {

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    /**
     * Name of the token
     */
    function name() external view returns (string memory);

    /**
     * Symbol of the token, eg. DAO, ETH, USDT, etc.
     */
    function symbol() external view returns (string memory);

    /**
     * Decimals of the token
     */
    function decimals() external view returns (uint8);

    /** 
     * Total supply of the token.
     * 
     * @return uint totalSupply
     */
    function totalSupply() external view returns (uint);

    /**
     * Balance of the owner.
     *
     * @param _owner The address to query the balance of.
     * @return The balance of the owner.
     */
    function balanceOf(address _owner) external view returns (uint);

    /**
     * The amount of tokens that an owner allowed to be spent on behalf of another.
     *
     * @param _to The address to query the allowance of.
     * @param _value The amount of tokens to query the allowance of.
     */
    function transfer(address _to, uint _value) external returns (bool);

    /**
     * TransferForm the address `_from` to the address `_to` the amount of tokens specified in `_value`.
     *
     * @return Whether the transfer was successful or not.
     */
    function transferFrom(address _from, address _to, uint _value) external returns (bool);

    /**
     * Approve the `_spender` to spend the amount of tokens specified in `_value`
     *
     * @param _spender The address that is allowed to spend the `_value` tokens.
     * @param _value The amount of tokens that are allowed to be spent by the `_spender`.
     */
    function approve(address _spender, uint _value) external returns (bool);
    
    /**
     * Allowance of `_owner` for spending the `_spender`'s tokens.
     *
     * @param _owner The address of the owner of the tokens.
     * @param _spender The address of the spender.
     * @return The amount of tokens that the `_owner` is allowed to spend on behalf of the `_spender`.
     */
    function allowance(address _owner, address _spender) external view returns (uint);
}