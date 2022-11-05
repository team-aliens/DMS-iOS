//  임시입니다.

import Foundation

struct NoticeList: Hashable {
    init(
        title: String,
        content: String
    ) {
        self.title = title
        self.content = content
    }

    var title: String
    var content: String
}
