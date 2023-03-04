import WatchRestAPIModule

protocol NoticeStateProtocol {
    var noticeList: [NoticeEntity] { get }
    var isLoading: Bool { get }
    var isError: Bool { get }
}

protocol NoticeActionProtocol: AnyObject {
    func updateNoticeList(noticeList: [NoticeEntity])
    func updateIsLoading(isLoading: Bool)
    func updateIsError(isError: Bool)
}
