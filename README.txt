Import folder máy ảo vào VMWare, đặt chế độ Nat.
Cred: client1:client1

Cái ni thì mới test ở Docker Desktop Windows, nếu ai dùng os khác thì cấu hình phần IP máy ảo nha.

Cái máy ảo client được built trên Nat, nên khi login được vào máy ảo, thì chạy lệnh sau và thay đổi IP thành IP gateway của Nat của card mạng Vmware
'''sudo nano /etc/syslog-ng/syslog-ng.conf'''
Tìm đến phần "destination", thay IP "192.168.64.1" thành địa chỉ IP gateway của VMWare

Mở terminal đến folder của proj, chạy lần lượt các lệnh sau:
	docker-compose up setup
	docker-compose build
	docker-compose up -d
	
Truy cập vào localhost:5601 với elastic:elastic1111

Trong Kibana, lần lượt xem các logs với các pattern sau (với điều kiện phải tương tác với máy client)
	syslog-*
	auth-*
	ssh-*
	kernel-*
	daemon-*
	auditd-*
	local-*
	
Các log có thể xuất hiện chậm hoặc nhanh tuỳ thuộc.

Các bug chưa fix:
	- Node centralized_log_server lâu lâu bị quá tải sau 10 phút chạy ?
	- Chưa visualize được trong Kibana ?
	- Chưa alert ?
	- Chưa cấu hình AppArmor để bảo vệ Log ?