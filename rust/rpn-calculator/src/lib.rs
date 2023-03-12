#[derive(Debug)]
pub enum CalculatorInput {
    Add,
    Subtract,
    Multiply,
    Divide,
    Value(i32),
}

pub fn evaluate(inputs: &[CalculatorInput]) -> Option<i32> {
    let mut stack = vec![];

    for input in inputs {
        match input {
            CalculatorInput::Value(val) => {
                stack.push(val.clone());
            }
            _ => {
                let a = stack.pop();
                let b = stack.pop();
                match (a, b) {
                    (Some(a), Some(b)) => match input {
                        CalculatorInput::Add => stack.push(b + a),
                        CalculatorInput::Subtract => stack.push(b - a),
                        CalculatorInput::Multiply => stack.push(b * a),
                        CalculatorInput::Divide => stack.push(b / a),
                        _ => return None,
                    },
                    _ => return None,
                }
            }
        }
    }
    if stack.len() == 1 {
        stack.pop()
    } else {
        None
    }
}
