// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MyToken {
    // -------------------------------
    // ERC20 State Variables
    // -------------------------------
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;

    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;

    // -------------------------------
    // Events (ERC20 Standard)
    // -------------------------------
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    // -------------------------------
    // Constructor
    // -------------------------------
    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimals,
        uint256 _initialSupply
    ) {
        require(bytes(_name).length > 0, "name required");
        require(bytes(_symbol).length > 0, "symbol required");
        require(_initialSupply > 0, "initialSupply>0");
        require(_decimals <= 77, "decimals too big"); // safe upper bound

        name = _name;
        symbol = _symbol;
        decimals = _decimals;

        // Safe multiplication: initialSupply * 10^decimals
        uint256 scale = 10 ** uint256(decimals);
        require(_initialSupply <= type(uint256).max / scale, "supply overflow");

        uint256 supplyWithDecimals = _initialSupply * scale;
        totalSupply = supplyWithDecimals;
        _balances[msg.sender] = supplyWithDecimals;

        emit Transfer(address(0), msg.sender, supplyWithDecimals);
    }

    // -------------------------------
    // View Functions
    // -------------------------------

    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }

    function allowance(address owner, address spender)
        public
        view
        returns (uint256)
    {
        return _allowances[owner][spender];
    }

    // -------------------------------
    // Transfer Logic
    // -------------------------------

    function transfer(address to, uint256 value) public returns (bool) {
        require(to != address(0), "transfer to zero address");
        require(_balances[msg.sender] >= value, "insufficient balance");

        _balances[msg.sender] -= value;
        _balances[to] += value;

        emit Transfer(msg.sender, to, value);
        return true;
    }

    // -------------------------------
    // Approve & Allowance Logic
    // -------------------------------

    function approve(address spender, uint256 value) public returns (bool) {
        require(spender != address(0), "approve to zero address");

        _allowances[msg.sender][spender] = value;

        emit Approval(msg.sender, spender, value);
        return true;
    }

    function transferFrom(address from, address to, uint256 value)
        public
        returns (bool)
    {
        require(to != address(0), "transfer to zero address");
        require(_balances[from] >= value, "insufficient balance");
        require(_allowances[from][msg.sender] >= value, "allowance too low");

        _balances[from] -= value;
        _balances[to] += value;
        _allowances[from][msg.sender] -= value;

        emit Transfer(from, to, value);
        return true;
    }

    // -------------------------------
    // Increase/Decrease Allowance (optional but recommended)
    // -------------------------------
    function increaseAllowance(address spender, uint256 addedValue)
        public
        returns (bool)
    {
        require(spender != address(0), "zero address");
        _allowances[msg.sender][spender] += addedValue;

        emit Approval(msg.sender, spender, _allowances[msg.sender][spender]);
        return true;
    }

    function decreaseAllowance(address spender, uint256 subtractedValue)
        public
        returns (bool)
    {
        require(spender != address(0), "zero address");
        uint256 currentAllowance = _allowances[msg.sender][spender];
        require(currentAllowance >= subtractedValue, "below zero");

        _allowances[msg.sender][spender] = currentAllowance - subtractedValue;

        emit Approval(msg.sender, spender, _allowances[msg.sender][spender]);
        return true;
    }
}
