import uniffi_foreign_async_trait
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
    let result = await impl.asyncFn()
	assert(result == "Hello from Swift")
	counter.leave()
}

counter.wait()
