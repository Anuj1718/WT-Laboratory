package com.example.ejb;

import jakarta.ejb.Local;

@Local
public interface AccountService {
    void deposit(String accountNumber, double amount);
    void withdraw(String accountNumber, double amount);
    double getBalance(String accountNumber);
}