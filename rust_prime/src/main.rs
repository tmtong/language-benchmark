fn main() {
    let mut target_prime : u32 = 10000;
    let mut current_num : u32 = 2;
    let mut current_denominator : u32 = current_num - 1;
    loop {
   
        if current_denominator == 1 {
            target_prime = target_prime - 1;
            if target_prime == 0 {
                println!("Prime numbers is {}", current_num);
                break;
            }     
            current_num = current_num + 1;
            current_denominator = current_num - 1
        }

        if current_num % current_denominator != 0 {
            current_denominator = current_denominator - 1;
            continue;
        }
        if current_num % current_denominator == 0 {
            current_num = current_num + 1;
            current_denominator = current_num - 1;
            continue;
        }
    }
}

/*
target_prime = 10000
current_num = 2
current_denominator = current_num - 1
while True:
  if current_denominator == 1:
    # this is a prime number
    # print(current_num)
    target_prime = target_prime - 1
    current_num = current_num + 1
    current_denominator = current_num - 1
  if target_prime == 0:
    print(target_prime)
    break
  if current_num % current_denominator != 0:
    current_denominator = current_denominator - 1
    continue
    # not divisible, keep going
  if current_num % current_denominator == 0:
    # divisible, this is definitely not prime
    current_num = current_num + 1
    current_denominator = current_num - 1
    continue
*/