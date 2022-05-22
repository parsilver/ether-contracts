//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./erc20.sol";

contract Wallet is ERC20 {

    /**
     * Balance of the owner.
     * example: owner => balance
     */
    mapping(address => uint) _balances;

    /**
     * The amount of tokens that an owner allowed to be spent on behalf of another.
     * example: owner => {spender => allowance}
     */
    mapping(address => mapping(address => uint)) _allowances;


    uint private _totalSupply;
    string private _name;
    string private _symbol;
    uint8 private _decimals;


    constructor(string memory name_, string memory symbol_) public {
        _name = name_;
        _symbol = symbol_;
        _totalSupply = 0;
        _decimals = 18;
    }

    /**
     * Name of the token
     */
    function name() external view returns (string memory) {
        return _name;
    }

    /**
     * Symbol of the token, eg. DAO, ETH, USDT, etc.
     */
    function symbol() external view returns (string memory) {
        return _symbol;
    }

    /**
     * Decimals of the token
     */
    function decimals() external view returns (uint8) {
        return _decimals;
    }

    /** 
     * Total supply of the token.
     * 
     * @return uint totalSupply
     */
    function totalSupply() external view returns (uint) {
        return _totalSupply;
    }

    /**
     * Balance of the owner.
     *
     * @param _owner The address to query the balance of.
     * @return The balance of the owner.
     */
    function balanceOf(address _owner) external view returns (uint) {
        require(address(_owner) != address(0));

        return _balances[_owner];
    }

    /**
     * The amount of tokens that an owner allowed to be spent on behalf of another.
     *
     * @param _to The address to query the allowance of.
     * @param _value The amount of tokens to query the allowance of.
     */
    function transfer(address _to, uint _value) external returns (bool) {
        require(address(_to) != address(0));

        _balances[msg.sender] -= _value;
        _balances[_to] += _value;

        emit Transfer(msg.sender, _to, _value);

        return true;
    }

    /**
     * TransferForm the address `_from` to the address `_to` the amount of tokens specified in `_value`.
     *
     * @return Whether the transfer was successful or not.
     */
    function transferFrom(address _from, address _to, uint _value) external returns (bool) {
        require(address(_from) != address(0));
        require(address(_to) != address(0));

        require(_value <= _allowances[_from][msg.sender]);

        _balances[_from] -= _value;
        _balances[_to] += _value;

        _allowances[_from][msg.sender] -= _value;

        emit Transfer(_from, _to, _value);

        return true;
    }

    /**
     * Approve the `_spender` to spend the amount of tokens specified in `_value`
     *
     * @param _spender The address that is allowed to spend the `_value` tokens.
     * @param _value The amount of tokens that are allowed to be spent by the `_spender`.
     */
    function approve(address _spender, uint _value) external returns (bool) {
        require(address(_spender) != address(0));

        _allowances[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);

        return true;
    }
    
    /**
     * Allowance of `_owner` for spending the `_spender`'s tokens.
     *
     * @param _owner The address of the owner of the tokens.
     * @param _spender The address of the spender.
     * @return The amount of tokens that the `_owner` is allowed to spend on behalf of the `_spender`.
     */
    function allowance(address _owner, address _spender) external view returns (uint) {
        require(address(_owner) != address(0));
        require(address(_spender) != address(0));

        return _allowances[_owner][_spender];
    }
    
}