Bài tập lớn nhập môn công nghệ phần mềm

Đề tài 4:

Quản lý lịch sinh hoạt / họp tổ dân phố
Cán bộ hành chính có nhiệm vụ xây dựng lịch họp tổ dân phố theo định kỳ, mỗi buổi
họp / sinh hoạt sẽ có chủ đề cụ thể và thời gian, địa điểm tổ chức để in giấy mời
gửi đến các hộ gia đình. Các hoạt động này thường sẽ là đại diện hộ gia đình tham
gia, cán bộ hành chính cần ghi nhận hộ gia đình đã tham gia các hoạt động chung 
của tổ dân phố để cuối năm thống kê, là một tiêu chí trong bình bầu “Gia đình văn
hoá”.

Hướng dẫn sử dụng:
1.	Khởi chạy:
Người dùng mở source code trên IDE bất kỳ rồi nhấp nút Run để khởi động chương trình.
2.	Đăng nhập:
Ở màn hình Đăng nhập, người dùng đăng nhập với tên tài khoản và mật khẩu được cấp. Phần mềm không hỗ trợ đăng ký tài khoản, chỉ hỗ trợ phân quyền dựa trên các tài khoản có sẵn.
3.	Giao diện chính:
Giao diện chính là nơi cung cấp các chức năng cơ bản và quan trọng của phần mềm. Màn hình giao diện chính có 4 nút chức năng chính tương ứng với mỗi tài khoản phân quyền sẵn.
Các chức năng được cung cấp:
	Giới hạn quyền hạn	Hướng dẫn
Xem thông tin cá nhân	Không	Người dùng chọn nút Trang chủ phía bên trái màn hình. Bên phải màn hình là thông tin cá nhân của người dùng như tên, ngày sinh, địa chỉ, mã số...
Tìm kiếm sự kiện	Chỉ có tài khoản của Cán bộ hành chính mới có thể nhìn thấy và sử dụng nút chức năng này	Người dùng chọn nút Quản lý phía bên trái màn hình và nhập vào ô tìm kiếm từ khóa của sự kiện cần tìm, chọn chức năng tìm kiếm theo tên, mã, ngày tháng hoặc tất cả. Sau đó người dùng bấm vào nút Tìm kiếm. Hệ thống sẽ tiến hành tìm kiếm trên cơ sở dữ liệu và trả về các sự kiện có liên quan dưới dạng bảng. Nếu không nhập gì vào ô tìm kiếm thì sẽ trả về tất cả sự kiện.
Tạo mới sự kiện	Chỉ có tài khoản của Cán bộ hành chính mới có thể nhìn thấy và sử dụng nút chức năng này	Người dùng chọn nút Quản lý phía bên trái màn hình và chọn tiếp nút Tạo mới. Người dùng nhập tất cả thông tin liên quan về sự kiện cần tạo mới như mã, tên sự kiện, ngày tháng... Sau đó người dùng bấm Lưu để lưu lại sự kiện vừa tạo mới vào cơ sở dữ liệu.

Sửa sự kiện	Chỉ có tài khoản của Cán bộ hành chính mới có thể nhìn thấy và sử dụng nút chức năng này	Người dùng chọn nút Quản lý phía bên trái màn hình, tìm đến sự kiện cần sửa trong bảng và bấm chọn rồi nhấp nút Sửa.
Xóa sự kiện	Chỉ có tài khoản của Cán bộ hành chính mới có thể nhìn thấy và sử dụng nút chức năng này	Người dùng chọn nút Quản lý phía bên trái màn hình, tìm đến sự kiện cần xóa trong bảng và bấm chọn rồi nhấp nút Xóa.
Cập nhật sự kiện	Chỉ có tài khoản của Cán bộ hành chính mới có thể nhìn thấy và sử dụng nút chức năng này	Người dùng chọn nút Quản lý phía bên trái màn hình, tìm đến sự kiện cần cập nhật trong bảng và bấm chọn rồi nhấp nút Cập nhật. Bảng thông tin các hộ dân và thành viên trong các hộ dân tham gia sự kiện được hiển thị. Chỉnh sửa các hộ dân tham gia bằng cách chọn hoặc bỏ chọn vào ô (hoặc nhấp nút Chọn tất cả nếu cần), chỉnh sửa thành viên trong hộ dân tham gia trong hộp đa lựa chọn. Sau khi đã chỉnh sửa những thông tin cần thiết, người dùng nhấn nút Cập nhật để lưu lại.
Gửi 
thông báo	Chỉ có tài khoản của Cán bộ hành chính mới có thể nhìn thấy và sử dụng nút chức năng này	Người dùng chọn nút Quản lý phía bên trái màn hình và chọn tiếp nút Gửi thông báo.

Thống kê các sự kiện trong năm	Chỉ có tài khoản của Cán bộ hành chính mới có thể nhìn thấy và sử dụng nút chức năng này	Người dùng chọn nút Thống kê phía bên trái màn hình. Bảng thống kê các hộ gia đình, số sự kiện tham gia, đạt hay không đạt tiêu chí Gia đình văn hóa sẽ được hiển thị.

Xem thông tin sự kiện tham gia	Chỉ có tài khoản của Người dân mới có thể nhìn thấy và sử dụng nút chức năng này	Người dùng chọn nút Sự kiện tham gia phía bên trái màn hình. Các sự kiện của tổ dân phố được hiển thị dưới dạng bảng, ngoài ra còn có các thông tin hộ dân của người đó có tham gia sự kiện hay không, thành viên nào trong gia đình tham gia.
Xem 
danh sách cán bộ	Chỉ có tài khoản của Người dân mới có thể nhìn thấy và sử dụng nút chức năng này
	Người dùng chọn nút Danh sách cán bộ phía bên trái màn hình. Danh sách các cán bộ tổ dân phố hiển thị dưới dạng bảng, có một số thông tin cần thiết cho người dân như điện thoại, email
Đăng xuất	Không	Người dùng chọn nút Đăng xuất phía bên trái màn hình. Đăng xuất sẽ đưa người dùng trở về màn hình Đăng nhập và buộc người dùng nhập lại tên tài khoản lẫn mật khẩu nếu muốn đăng nhập lại. Người dùng có thể nhấn nút X bên phải phía trên từ đây để thoát khỏi chương trình.

a. Xem thông tin cá nhân:
	Giới hạn quyền hạn: Không
	Hướng dẫn: Người dùng chọn nút Trang chủ phía bên trái màn hình. Bên phải màn hình là thông tin cá nhân của người dùng như tên, ngày sinh, địa chỉ, mã số...
b. Tìm kiếm sự kiện:
Giới hạn quyền hạn: Chỉ có tài khoản của Cán bộ hành chính mới có thể nhìn thấy và sử dụng nút chức năng này
Hướng dẫn: Người dùng chọn nút Quản lý phía bên trái màn hình và nhập vào ô tìm kiếm từ khóa của sự kiện cần tìm, chọn chức năng tìm kiếm theo tên, mã, ngày tháng hoặc tất cả. Sau đó người dùng bấm vào nút Tìm kiếm. Hệ thống sẽ tiến hành tìm kiếm trên cơ sở dữ liệu và trả về các sự kiện có liên quan dưới dạng bảng. Nếu không nhập gì vào ô tìm kiếm thì sẽ trả về tất cả sự kiện.
c. Tạo mới sự kiện:
Giới hạn quyền hạn: Chỉ có tài khoản của Cán bộ hành chính mới có thể nhìn thấy và sử dụng nút chức năng này
Hướng dẫn: Người dùng chọn nút Quản lý phía bên trái màn hình và chọn tiếp nút Tạo mới. Người dùng nhập tất cả thông tin liên quan về sự kiện cần tạo mới như mã, tên sự kiện, ngày tháng... Sau đó người dùng bấm Lưu để lưu lại sự kiện vừa tạo mới vào cơ sở dữ liệu.
d. Sửa sự kiện:
Giới hạn quyền hạn: Chỉ có tài khoản của Cán bộ hành chính mới có thể nhìn thấy và sử dụng nút chức năng này
Hướng dẫn: Người dùng chọn nút Quản lý phía bên trái màn hình, tìm đến sự kiện cần sửa trong bảng và bấm chọn rồi nhấp nút Sửa.
e. Xóa sự kiện:
Giới hạn quyền hạn: Chỉ có tài khoản của Cán bộ hành chính mới có thể nhìn thấy và sử dụng nút chức năng này
Hướng dẫn: Người dùng chọn nút Quản lý phía bên trái màn hình, tìm đến sự kiện cần xóa trong bảng và bấm chọn rồi nhấp nút Xóa.
f. Cập nhật sự kiện:
Giới hạn quyền hạn: Chỉ có tài khoản của Cán bộ hành chính mới có thể nhìn thấy và sử dụng nút chức năng này
Hướng dẫn sử dụng: Người dùng chọn nút Quản lý phía bên trái màn hình, tìm đến sự kiện cần cập nhật trong bảng và bấm chọn rồi nhấp nút Cập nhật. Bảng thông tin các hộ dân và thành viên trong các hộ dân tham gia sự kiện được hiển thị. Chỉnh sửa các hộ dân tham gia bằng cách chọn hoặc bỏ chọn vào ô (hoặc nhấp nút Chọn tất cả nếu cần), chỉnh sửa thành viên trong hộ dân tham gia trong hộp đa lựa chọn. Sau khi đã chỉnh sửa những thông tin cần thiết, người dùng nhấn nút Cập nhật để lưu lại.
g. Gửi thông báo:
Giới hạn quyền hạn: Chỉ có tài khoản của Cán bộ hành chính mới có thể nhìn thấy và sử dụng nút chức năng này
Hướng dẫn sử dụng: Người dùng chọn nút Quản lý phía bên trái màn hình và chọn tiếp nút Gửi thông báo.
h. Thống kê các sự kiện trong năm:
	Giới hạn quyền hạn: Chỉ có tài khoản của Cán bộ hành chính mới có thể nhìn thấy và sử dụng nút chức năng này
	Hướng dẫn sử dụng: Người dùng chọn nút Thống kê phía bên trái màn hình. Bảng thống kê các hộ gia đình, số sự kiện tham gia, đạt hay không đạt tiêu chí Gia đình văn hóa sẽ được hiển thị.
i. Xem thông tin sự kiện tham gia: 
	Giới hạn quyền hạn: Chỉ có tài khoản của Người dân mới có thể nhìn thấy và sử dụng nút chức năng này
	Hướng dẫn: Người dùng chọn nút Sự kiện tham gia phía bên trái màn hình. Các sự kiện của tổ dân phố được hiển thị dưới dạng bảng, ngoài ra còn có các thông tin hộ dân của người đó có tham gia sự kiện hay không, thành viên nào trong gia đình tham gia.
j. Xem danh sách cán bộ: 
	Giới hạn quyền hạn: Chỉ có tài khoản của Người dân mới có thể nhìn thấy và sử dụng nút chức năng này
	Hướng dẫn: Người dùng chọn nút Danh sách cán bộ phía bên trái màn hình. Danh sách các cán bộ tổ dân phố hiển thị dưới dạng bảng, có một số thông tin cần thiết cho người dân như điện thoại, email.
k. Đăng xuất: 
	Giới hạn quyền hạn: Không
	Hướng dẫn: Người dùng chọn nút Đăng xuất phía bên trái màn hình. Đăng xuất sẽ đưa người dùng trở về màn hình Đăng nhập và buộc người dùng nhập lại tên tài khoản lẫn mật khẩu nếu muốn đăng nhập lại. Người dùng có thể nhấn nút X bên phải phía trên từ đây để thoát khỏi chương trình.
