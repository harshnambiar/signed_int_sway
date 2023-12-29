library;
 
pub struct Signed {
    sign: bool,
    value: u64,
}

impl Signed {
    // creates a signed integer with said sign and value
	fn to(s: bool, v: u64) -> Signed {
		let sn = Signed {
			sign: s,
			value: v,
		};
		return sn;
	}

	// fetches the value of the signed integer
	fn val(s: Signed) -> u64 {
		s.value
	}

	// fetches the sign of the signed integer, with true being positive and false being negative values
	fn sn(s: Signed) -> bool {
		s.sign
	}

	// returns 0 as a signed integer
	fn zero() -> Signed {
		let sn = Signed {
			sign: true,
			value: 0,
		};
		return sn;
	}

	// returns 1 as a signed integer
	fn one() -> Signed {
		let sn = Signed {
			sign: true,
			value: 1,
		};
		return sn;
	}

	// returns -1 as a signed integer
	fn minus_one() -> Signed {
		let sn = Signed {
			sign: false,
			value: 1,
		};
		return sn;
	}

	// returns a signed integer with the same value but opposite sign
	fn reverse(s: Signed) -> Signed {
		let sn = Signed {
			sign: !s.sign,
			value: s.value,
		};
		return sn;
	}

    // returns the sum of two signed integers
	fn add(s1: Signed, s2: Signed) -> Signed {
		if s1.sign == s2.sign {
			let sn = Signed {
				sign: s1.sign,
				value: s1.value+s2.value,
			};
			return sn;
		}
		else {
			if (s1.value > s2.value){
				let sn = Signed {
					sign: s1.sign,
					value: s1.value-s2.value,
				};
				return sn;
			}
			else {
				let sn = Signed {
					sign: s2.sign,
					value: s2.value-s1.value,
				};
				return sn;
			}
		}
	}


	// returns the latter signed integer subtracted from the former
	fn subtract(s1: Signed, s2: Signed) -> Signed {
		if s1.sign != s2.sign {
			let sn = Signed {
				sign: s1.sign,
				value: s1.value+s2.value,
			};
			return sn;
		}
		else {
			if (s1.value > s2.value){
				let sn = Signed {
					sign: s1.sign,
					value: s1.value-s2.value,
				};
				return sn;
			}
			else {
				let sn = Signed {
					sign: s2.sign,
					value: s2.value-s1.value,
				};
				return sn;
			}
		}
	}


	// returns the product of two signed integers
	fn multiply(s1: Signed, s2: Signed) -> Signed {
		let sn = Signed {
			sign: (s1.sign == s2.sign),
			value: s1.value*s2.value,
		};
		return sn;
	}

	// returns the quotient when the former signed integer is divided by the latter
	fn divide(s1: Signed, s2: Signed) -> Signed {
		assert (s2.value != 0);
		let sn = Signed {
			sign: (s1.sign == s2.sign),
			value: s1.value/s2.value,
		};
		return sn;
	}

	// if a > b return 1
	// if a < b return 2
	// if a == b return 0
	fn compare(s1: Signed, s2: Signed) -> u32 {
		if ((s1.value == s2.value) && (s1.value == 0)){
			return 0;
		}
		else {
			if (s1.sign != s2.sign){
				if (s1.sign){
					return 1;
				}
				else {
					return 2;
				}
			}
			else {
				
				if (s1.value > s2.value){
					if (s1.sign){
						return 1;
					}
					else {
						return 2;
					}
				}
				else {
					if (s1.value != s2.value){
						if (s1.sign){
							return 2;
						}
						else {
							return 1;
						}
					}
					else {
						return 0;
					}
					
				}
				
			}
		}
		
	}


	// returns a signed integer raised to a power
	fn power(s: Signed, k: u64) -> Signed {
		assert (k > 0);
		let mut val = 1;
		let mut i = 1;
		while i <= k {
			
			val = val * s.value;
			i += 1;
		};
		
		let sn = Signed {
			sign: ((k % 2 == 0) || (s.sign)),
			value: val,
		};
		return sn;
	}


	// returns the signed integer shifted to the left by n bits
	fn left_shift(s: Signed, n: u64) -> Signed {
		let mut pow = 1;
		let mut i = 0;
		while i < n {
			
			pow = pow * 2;
			i += 1;
		};
		if n == 0 {
			return s;
		}
		else {
			let sn = Signed {
				sign: s.sign,
				value: s.value * pow,
			};
			return sn;
		}
		
	}


	// returns a signed integer shifted to the right by n bits
	fn right_shift(s: Signed, n: u64) -> Signed {
		let mut pow = 1;
		let mut i = 0;
		while i < n {
			
			pow = pow * 2;
			i += 1;
		};
		let mut val_final = s.value/pow;
		let mut rem = 0;
		if val_final * pow != s.value {
			rem = 1;
		}
		 if s.sign {
			if (rem == 1) && (val_final != 0){
				val_final -= 0;
			}
		}
		else {
			if (rem == 1) {
				val_final += 1;
			}
		}

		if n == 0 {
			return s;
		}
		else {
			let sn = Signed {
				sign: s.sign,
				value: val_final,
			};
			return sn;
		}
		
	}
}

#[test]
fn test_create_signed() {
    let s = Signed::to(true, 7);
	assert(s.value == 7);
}

#[test]
fn test_create_zero() {
    let s = Signed::zero();
	assert(s.value == 0);
}

#[test]
fn test_create_one() {
    let s = Signed::one();
	assert(s.value == 1);
	assert(s.sign);
}

#[test]
fn test_create_minus_one() {
    let s = Signed::minus_one();
	assert(s.value == 1);
	assert(!s.sign);
}

#[test]
fn test_reverse(){
    let s= Signed::to(true, 7);
    let srev = Signed::reverse(s);
    assert (srev.value == 7);
    assert (srev.sign != s.sign);
}

#[test]
fn test_sum_signed(){
    let s1 = Signed::to(true, 5);
    let s2 = Signed::to(true, 8);
    let s = Signed::add(s1, s2);
    assert (s.value == 13);
}

#[test]
fn test_sum_negative_signed(){
    let s1 = Signed::to(true, 5);
    let s2 = Signed::to(false, 8);
    let s = Signed::add(s1, s2);
    assert (s.value == 3);
}

#[test]
fn test_diff_signed(){
    let s1 = Signed::to(true, 15);
    let s2 = Signed::to(true, 8);
    let s = Signed::subtract(s1, s2);
    assert (s.value == 7);
}


#[test]
fn test_diff_negative_signed(){
    let s1 = Signed::to(true, 5);
    let s2 = Signed::to(false, 8);
    let s = Signed::subtract(s1, s2);
    assert (s.value == 13);
}

#[test]
fn test_mul_signed(){
    let s1 = Signed::to(true, 5);
    let s2 = Signed::to(true, 8);
    let s = Signed::multiply(s1, s2);
    assert (s.value == 40);
}


#[test]
fn test_mul_negative_signed(){
    let s1 = Signed::to(true, 1);
    let s2 = Signed::to(false, 8);
    let s = Signed::multiply(s1, s2);
    assert (s.value == 8);
    assert (!s.sign);
}

#[test]
fn test_div_signed(){
    let s1 = Signed::to(true, 5);
    let s2 = Signed::to(true, 8);
    let s = Signed::divide(s1, s2);
    assert (s.value == 0);
}


#[test]
fn test_div_negative_signed(){
    let s1 = Signed::to(true, 16);
    let s2 = Signed::to(false, 8);
    let s = Signed::divide(s1, s2);
    assert (s.value == 2);
    assert (!s.sign);
}

#[test]
	fn test_compare_signed1(){
		let s1 = Signed::to(true, 2);
		let s2 = Signed::to(false, 8);
		let cmp = Signed::compare(s1, s2);
		assert (cmp == 1);
	}

#[test]
fn test_compare_signed2(){
	let s1 = Signed::to(false, 2);
	let s2 = Signed::to(true, 8);
	let cmp = Signed::compare(s1, s2);
	assert (cmp == 2);
}

#[test]
fn test_compare_signed0(){
	let s1 = Signed::to(true, 0);
	let s2 = Signed::to(false, 0);
	let cmp = Signed::compare(s1, s2);
	assert (cmp == 0);
}

#[test]
fn test_power1(){
	let s= Signed::to(false, 2);
	let spow = Signed::power(s, 2);
	assert (spow.value == 4);
	assert (spow.sign != s.sign);
}

#[test]
fn test_power2(){
	let s= Signed::to(true, 3);
	let spow = Signed::power(s, 3);
	assert (spow.value == 27);
	assert (spow.sign == s.sign);
}

#[test]
fn test_lshift_signed1(){
	let s1 = Signed::to(true, 6);
	
	let s = Signed::left_shift(s1, 2);
	assert (s.value == 24);
	
}

#[test]
fn test_lshift_signed2(){
	let s1 = Signed::to(false, 6);
	
	let s = Signed::left_shift(s1, 2);
	assert (s.value == 24);
	assert (!s.sign);
}

#[test]
fn test_rshift_signed1(){
	let s1 = Signed::to(true, 21);
	
	let s = Signed::right_shift(s1, 2);
	assert (s.value == 5);
	
}

#[test]
fn test_rshift_signed2(){
	let s1 = Signed::to(false, 23);
	
	let s = Signed::right_shift(s1, 3);
	assert (s.value == 3);
	assert (!s.sign);
}
