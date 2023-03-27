#[derive(Debug, PartialEq, Eq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

pub fn sublist<T: PartialEq>(a: &[T], b: &[T]) -> Comparison {
    use Comparison::*;

    if a == b {
        Equal
    } else if sub(a, b) {
        Sublist
    } else if sub(b, a) {
        Superlist
    } else {
        Unequal
    }
}

fn sub<T: PartialEq>(a: &[T], b: &[T]) -> bool {
    a.is_empty() || b.windows(a.len()).any(|b| b == a)
}
