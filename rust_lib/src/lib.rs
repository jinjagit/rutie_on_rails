#![allow(improper_ctypes_definitions)] // Hide the 'not FFI-safe' warnings!

#[macro_use]
extern crate rutie_serde;

use rutie::{class, Object};
use rutie_serde::rutie_serde_methods;

class!(RustLib);

rutie_serde_methods!(
    RustLib,
    _itself,
    ruby_class!(Exception),

    fn pub_hello_world() -> String {
        let string = format!("Rust says 'Hi!'");

        string
    }

    fn pub_reverse(array: Vec<String>) -> Vec<String> {
        let reverse = array.into_iter().rev().collect();

        reverse
    }
);

// Entrypoint function (that Ruby can call):
#[no_mangle]
pub extern "C" fn Init_rust_lib() {
    rutie::Class::new("RustLib", None).define(|itself| {
        itself.def_self("hello_world", pub_hello_world);
        itself.def_self("reverse", pub_reverse);
    });
}
