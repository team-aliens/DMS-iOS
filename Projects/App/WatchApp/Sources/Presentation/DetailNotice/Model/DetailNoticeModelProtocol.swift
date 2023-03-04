import WatchRestAPIModule

protocol DetailNoticeStateProtocol {
    var notice: DetailNoticeEntity? { get }
    var isLoading: Bool { get }
    var isError: Bool { get }
}

protocol DetailNoticeActionProtocol: AnyObject {
    func updateDetailNotice(notice: DetailNoticeEntity?)
    func updateIsLoading(isLoading: Bool)
    func updateIsError(isError: Bool)
}
