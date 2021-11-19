import 'package:pmap/pmap.dart';

class Argument {
  Argument(this.start, this.end);
  int start = 0;
  int end = 0;
}

double chunk(dynamic arg) {
  int start = arg.start;
  int end = arg.end;
  double accum = 0.0;
  int sign = -1;
  if (start % 2 == 0) {
    sign = 1;
  }
  for (int i = start; i < end; i++) {
    double denominator = i * 2 + 1.0;
    accum = accum + 1.0 / denominator * sign;
    sign = sign * -1;
  }
  return accum;
}

void main() async {
  int numprocessor = 8;
  int batchsize = (1000000000 ~/ numprocessor);

  List arguments = [];
  for (int i = 0; i < numprocessor; i++) {
    Argument arg = Argument(i * batchsize, (i + 1) * batchsize);
    arguments.add(arg);
  }
  final results = arguments.mapParallel(chunk, parallel: numprocessor);
  List<double> resultsList = await results.toList();
  double sum = resultsList.reduce((a, b) => a + b);
  sum = sum * 4;
  print('Prime number is ' + sum.toString());
}
