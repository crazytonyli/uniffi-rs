use uniffi_foreign_async_trait::AsyncTrait;
use std::sync::Arc;

#[derive(Debug, uniffi::Object)]
pub struct App {
    pub foreign: Arc<dyn AsyncTrait>
}

#[uniffi::export]
impl App {
    #[uniffi::constructor]
    pub fn new(foreign: Arc<dyn AsyncTrait>) -> Self {
        Self { foreign }
    }

    pub async fn async_fn(&self) -> String {
        println!("[Rust] App::async_fn");
        self.foreign.async_fn().await
    }
}

uniffi::setup_scaffolding!();
