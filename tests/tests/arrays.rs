use crate::common::{any_felt, load_cairo, run_native_program, run_vm_program};
use crate::common::{compare_outputs, DEFAULT_GAS};
use cairo_lang_runner::{Arg, SierraCasmRunner};
use cairo_lang_sierra::program::Program;
use cairo_native::starknet::DummySyscallHandler;
use cairo_native::Value;
use lazy_static::lazy_static;
use proptest::prelude::*;
use starknet_types_core::felt::Felt;

lazy_static! {
    static ref ARRAY_GET: (String, Program, SierraCasmRunner) = load_cairo! {
        use array::ArrayTrait;
        use traits::TryInto;
        use core::option::OptionTrait;

        fn run_test(value: felt252, idx: felt252) -> felt252 {
            let mut numbers: Array<felt252> = ArrayTrait::new();

            numbers.append(value);
            numbers.append(value);
            numbers.append(value);
            numbers.append(value);
            numbers.append(value);
            numbers.append(value);
            numbers.append(value);
            numbers.append(value);
            numbers.append(value);
            numbers.append(value);
            numbers.append(value);
            numbers.append(value);
            numbers.append(value);
            numbers.append(value);
            numbers.append(value);
            numbers.append(value);
            numbers.append(value);
            numbers.append(value);
            numbers.append(value);
            numbers.append(value);
            numbers.append(value);
            numbers.append(value);
            numbers.append(value);
            numbers.append(value);
            numbers.append(value);
            numbers.append(value);
            numbers.append(value);
            *numbers.at(idx.try_into().unwrap())
        }
    };
}

#[test]
fn array_get_test() {
    let program = &ARRAY_GET;
    let result_vm = run_vm_program(
        program,
        "run_test",
        vec![Arg::Value(Felt::from(10)), Arg::Value(Felt::from(5))],
        Some(DEFAULT_GAS as usize),
    )
    .unwrap();
    let result_native = run_native_program(
        program,
        "run_test",
        &[Value::Felt252(10.into()), Value::Felt252(5.into())],
        Some(DEFAULT_GAS),
        Option::<DummySyscallHandler>::None,
    );

    compare_outputs(
        &program.1,
        &program.2.find_function("run_test").unwrap().id,
        &result_vm,
        &result_native,
    )
    .unwrap();
}

proptest! {
    #[test]
    fn array_get_test_proptest(value in any_felt(), idx in 0u32..26) {
        let program = &ARRAY_GET;
        let result_vm = run_vm_program(program, "run_test", vec![
            Arg::Value(Felt::from_bytes_be(&value.to_bytes_be())),
            Arg::Value(Felt::from(idx))
        ], Some(DEFAULT_GAS as usize)).unwrap();
        let result_native = run_native_program(
            program,
            "run_test",
            &[Value::Felt252(value), Value::Felt252(idx.into())],
            Some(DEFAULT_GAS),
            Option::<DummySyscallHandler>::None,
        );

        compare_outputs(
            &program.1,
            &program.2.find_function("run_test").unwrap().id,
            &result_vm,
            &result_native,
        )
        .unwrap();
    }
}
