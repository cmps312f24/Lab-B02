import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:qbanking_app/model/account.dart';
import 'package:qbanking_app/model/beneficiary.dart';
import 'package:qbanking_app/model/transfer.dart';

class BankingRepository {
  //create the Dio object and the base url
  final Dio _dio = Dio();

  //create the base url _baseUrl
  final String _baseUrl = 'https://api1.codedbyyou.com/api';

  // documentation can be found at
  // https://api1.codedbyyou.com/docs

//Add the getCustomerAccounts method

  Future<List<Account>> getCustomerAccounts(int customerId) async {
    Response response = await _dio.get('$_baseUrl/accounts/$customerId');

    if (response.statusCode != 200) {
      throw Exception('Failed to load accounts');
    }

    List<Account> accounts = [];
    for (var accountMap in response.data) {
      accounts.add(Account.fromJson(accountMap));
    }
    return accounts;
  }

// add the getTransfers method
  Future<List<Transfer>> getTransfers(int customerId) async {
    Response response = await _dio.get('$_baseUrl/transfers/$customerId');
    if (response.statusCode != 200) {
      throw Exception('Failed to load transfers');
    }

    List<Transfer> transfers = [];
    for (var transferMap in response.data) {
      transfers.add(Transfer.fromJson(transferMap));
    }
    return transfers;
  }

  //add the getBeneficiaries method
  Future<List<Beneficiary>> getBeneficiaries(int customerId) async {
    Response response = await _dio.get('$_baseUrl/beneficiaries/$customerId');

    List<Beneficiary> beneficiaries = [];
    for (var beneficiaryMap in response.data) {
      beneficiaries.add(Beneficiary.fromJson(beneficiaryMap));
    }
    return beneficiaries;
  }

  //add the addTransfer method
  Future<Transfer> addTransfer(Transfer transfer) async {
    Response response = await _dio.post('$_baseUrl/transfers/${transfer.cid}',
        data: transfer.toJson());

    if (response.statusCode == 404) {
      throw Exception('beneficiary not found');
    } else if (response.statusCode == 409) {
      throw Exception('insufficient funds');
    }

    return Transfer.fromJson(response.data);
  }

  Future<Beneficiary> addBeneficiary(Beneficiary beneficiary) async {
    var url = '$_baseUrl/beneficiaries/${beneficiary.cid}';
    Response response = await _dio.post(url, data: beneficiary.toJson());

    if (response.statusCode == 409) {
      throw Exception('beneficiary already exists');
    }

    return Beneficiary.fromJson(response.data);
  }

  Future<Beneficiary> updateBeneficiary(Beneficiary updatedBeneficiary) async {
    var url =
        '$_baseUrl/beneficiaries/${updatedBeneficiary.cid}/${updatedBeneficiary.accountNo}';
    Response response = await _dio.put(url, data: updatedBeneficiary.toJson());

    if (response.statusCode == 409) {
      throw Exception('beneficiary already exists');
    }

    return Beneficiary.fromJson(response.data);
  }

  Future<bool> removeTransfer(Transfer transfer) async {
    Response response = await _dio
        .delete('$_baseUrl/transfers/${transfer.cid}/${transfer.transferId}');

    if (response.statusCode != 200) {
      throw Exception('Failed to delete transfer');
    }
    return true;
  }
}
