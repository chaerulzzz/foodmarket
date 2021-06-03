part of 'transaction_cubit.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionLoaded extends TransactionState {
  final List<Transaction> transaction;

  TransactionLoaded(this.transaction);

  @override
  List<Object> get props => [transaction];
}

class TransactionLoadingError extends TransactionState {
  final String message;

  TransactionLoadingError(this.message);

  @override
  List<Object> get props => [message];
}
