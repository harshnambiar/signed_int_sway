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
}

#[test]
fn test_create_signed() {
    let s = Signed::to(true, 7);
	assert(s.value == 7);
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
