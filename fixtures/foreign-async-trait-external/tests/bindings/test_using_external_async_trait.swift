import uniffi_foreign_async_trait
import uniffi_foreign_async_trait_external
import Foundation

final class AsyncTraitSwiftImpl: AsyncTrait {
    func asyncFn() async -> String {
        return "Hello from Swift"
    }
}

var counter = DispatchGroup()

counter.enter()

Task {
    let impl = AsyncTraitSwiftImpl()
    let app = App(foreign: impl)
    let result = await app.asyncFn()
	assert(result == "Hello from Swift")
	counter.leave()
}

counter.wait()
