-- ============================================================
-- بيانات تجريبية — Asset Tracking & Ticketing System
-- كلمة المرور لكل الحسابات: 123456
-- hash = sha256("123456" + "ats_salt_2026")
-- ============================================================

DELETE FROM sessions;
DELETE FROM audit_logs;
DELETE FROM notifications;
DELETE FROM attachments;
DELETE FROM inventory_audit_items;
DELETE FROM inventory_audits;
DELETE FROM depreciation_entries;
DELETE FROM maintenance_schedules;
DELETE FROM ticket_parts;
DELETE FROM ticket_comments;
DELETE FROM ticket_logs;
DELETE FROM maintenance_tickets;
DELETE FROM sla_policies;
DELETE FROM location_logs;
DELETE FROM custody_logs;
DELETE FROM assets;
DELETE FROM categories;
DELETE FROM users;
DELETE FROM vendors;
DELETE FROM locations;
DELETE FROM departments;
DELETE FROM companies;
DELETE FROM system_settings;

-- الشركات
INSERT INTO companies (id, name, name_en, commercial_no, tax_number, address, is_active) VALUES
 (1, 'الشركة القابضة للاستثمار', 'Investment Holding Co.', 'CR-1001', 'TX-9001', 'الرياض - طريق الملك فهد', 1),
 (2, 'مصانع النور الصناعية', 'Al-Noor Industries', 'CR-1002', 'TX-9002', 'الدمام - المدينة الصناعية الثانية', 1),
 (3, 'شركة الأفق للتقنية', 'Horizon Tech', 'CR-1003', 'TX-9003', 'جدة - حي الروضة', 1);

-- الإدارات
INSERT INTO departments (id, company_id, name, code) VALUES
 (1, 1, 'الإدارة المالية', 'FIN'),
 (2, 1, 'الموارد البشرية', 'HR'),
 (3, 1, 'تقنية المعلومات', 'IT'),
 (4, 2, 'الإنتاج', 'PRD'),
 (5, 2, 'الصيانة', 'MNT'),
 (6, 3, 'التطوير', 'DEV'),
 (7, 3, 'الدعم الفني', 'SUP');

-- المواقع
INSERT INTO locations (id, company_id, name, type, address_details) VALUES
 (1, 1, 'المبنى الإداري الرئيسي', 'Office', 'الرياض - الدور 5'),
 (2, 1, 'مستودع الرياض', 'Warehouse', 'الرياض - المنطقة الصناعية'),
 (3, 1, 'شقق سكن الموظفين', 'Apartment', 'الرياض - حي النخيل'),
 (4, 2, 'مصنع الدمام 1', 'Factory', 'الدمام - صناعية 2'),
 (5, 2, 'مصنع الدمام 2', 'Factory', 'الدمام - صناعية 3'),
 (6, 3, 'مكتب جدة', 'Office', 'جدة - برج الأفق');

-- الموردون
INSERT INTO vendors (id, company_id, name, contact_person, phone, email) VALUES
 (1, 1, 'مؤسسة التقنية الحديثة', 'أحمد الغامدي', '0551112222', 'sales@modern-tech.sa'),
 (2, 1, 'شركة الأثاث المكتبي', 'سعد العتيبي', '0553334444', 'info@office-furn.sa'),
 (3, 2, 'الشرق للمعدات الصناعية', 'خالد الحربي', '0555556666', 'sales@east-eq.sa'),
 (4, 3, 'مورد الأجهزة الذكية', 'فهد القحطاني', '0557778888', 'contact@smart-dev.sa');

-- المستخدمون (كلمة المرور: 123456)
INSERT INTO users (id, company_id, department_id, full_name, email, password_hash, role, phone_number, job_title, employee_number, is_active) VALUES
 (1, 1, 3, 'مدير النظام', 'admin@ats.sa', 'aab31b802f33eb7298ec1aea14435b6bf81374c0066feec8ccb447c2892b529a', 'Admin', '0500000001', 'مدير النظام', 'EMP-0001', 1),
 (2, 1, 1, 'عبدالله المالكي', 'manager1@ats.sa', 'aab31b802f33eb7298ec1aea14435b6bf81374c0066feec8ccb447c2892b529a', 'CompanyManager', '0500000002', 'مدير شركة', 'EMP-0002', 1),
 (3, 2, 5, 'ماجد الشمري', 'manager2@ats.sa', 'aab31b802f33eb7298ec1aea14435b6bf81374c0066feec8ccb447c2892b529a', 'CompanyManager', '0500000003', 'مدير مصانع النور', 'EMP-0003', 1),
 (4, 1, 3, 'يوسف التميمي', 'tech1@ats.sa', 'aab31b802f33eb7298ec1aea14435b6bf81374c0066feec8ccb447c2892b529a', 'Technician', '0500000004', 'فني صيانة أجهزة', 'EMP-0004', 1),
 (5, 2, 5, 'راشد الدوسري', 'tech2@ats.sa', 'aab31b802f33eb7298ec1aea14435b6bf81374c0066feec8ccb447c2892b529a', 'Technician', '0500000005', 'فني معدات صناعية', 'EMP-0005', 1),
 (6, 1, 1, 'نورة السبيعي', 'emp1@ats.sa', 'aab31b802f33eb7298ec1aea14435b6bf81374c0066feec8ccb447c2892b529a', 'Employee', '0500000006', 'محاسبة', 'EMP-0006', 1),
 (7, 1, 2, 'سارة العنزي', 'emp2@ats.sa', 'aab31b802f33eb7298ec1aea14435b6bf81374c0066feec8ccb447c2892b529a', 'Employee', '0500000007', 'أخصائي موارد بشرية', 'EMP-0007', 1),
 (8, 2, 4, 'تركي الزهراني', 'emp3@ats.sa', 'aab31b802f33eb7298ec1aea14435b6bf81374c0066feec8ccb447c2892b529a', 'Employee', '0500000008', 'مشرف إنتاج', 'EMP-0008', 1),
 (9, 3, 6, 'ليلى الأحمدي', 'emp4@ats.sa', 'aab31b802f33eb7298ec1aea14435b6bf81374c0066feec8ccb447c2892b529a', 'Employee', '0500000009', 'مطور برمجيات', 'EMP-0009', 1);

UPDATE departments SET manager_user_id = 2 WHERE id = 1;
UPDATE departments SET manager_user_id = 3 WHERE id = 5;

-- التصنيفات (شجرية)
INSERT INTO categories (id, parent_category_id, name, code, default_useful_life_years, default_salvage_rate) VALUES
 (1, NULL, 'أجهزة تقنية', 'IT', 4, 0.10),
 (2, NULL, 'معدات مصانع', 'EQ', 10, 0.05),
 (3, NULL, 'عقارات', 'RE', 25, 0.20),
 (4, NULL, 'أثاث مكتبي', 'FR', 8, 0.05),
 (5, NULL, 'سيارات', 'VH', 6, 0.15),
 (6, 1, 'لابتوبات', 'IT-LP', 4, 0.10),
 (7, 1, 'طابعات', 'IT-PR', 5, 0.05),
 (8, 1, 'شاشات', 'IT-MN', 5, 0.05),
 (9, 1, 'سيرفرات', 'IT-SV', 6, 0.10),
 (10, 2, 'آلات تصنيع', 'EQ-MC', 12, 0.05),
 (11, 2, 'مولدات كهرباء', 'EQ-GN', 15, 0.08),
 (12, 3, 'شقق سكنية', 'RE-AP', 30, 0.25),
 (13, 4, 'مكاتب', 'FR-DK', 10, 0.05),
 (14, 4, 'كراسي', 'FR-CH', 6, 0.05),
 (15, 5, 'سيارات صالون', 'VH-SD', 6, 0.15);

-- سياسات SLA
INSERT INTO sla_policies (id, name, priority, response_time_hours, resolution_time_hours, is_active) VALUES
 (1, 'حرجة — توقف عمل كامل', 'Critical', 1, 4, 1),
 (2, 'عالية — تأثير كبير', 'High', 4, 24, 1),
 (3, 'متوسطة — تأثير محدود', 'Medium', 8, 72, 1),
 (4, 'منخفضة — طلب عادي', 'Low', 24, 168, 1);

-- الأصول
INSERT INTO assets (id, asset_tag, company_id, category_id, location_id, vendor_id, current_custody_user_id, name, serial_number, brand, model, status, purchase_cost, purchase_date, warranty_expiry_date, useful_life_years, salvage_value, accumulated_depreciation, book_value, notes) VALUES
 (1,  'AST-2026-00001', 1, 6,  1, 1, 6, 'لابتوب Dell Latitude 5540', 'SN-DL-88213', 'Dell', 'Latitude 5540', 'Active', 6500, '2025-03-15', '2028-03-15', 4, 650, 1218.75, 5281.25, 'عهدة قسم المالية'),
 (2,  'AST-2026-00002', 1, 6,  1, 1, 7, 'لابتوب HP EliteBook 840', 'SN-HP-77120', 'HP', 'EliteBook 840 G10', 'Active', 7200, '2025-06-01', '2028-06-01', 4, 720, 1080.00, 6120.00, 'عهدة الموارد البشرية'),
 (3,  'AST-2026-00003', 1, 7,  1, 1, NULL, 'طابعة HP LaserJet Pro', 'SN-HP-PR-4410', 'HP', 'LaserJet Pro M404', 'Active', 2300, '2024-11-20', '2026-11-20', 5, 115, 1003.75, 1296.25, 'طابعة الدور الخامس'),
 (4,  'AST-2026-00004', 1, 8,  1, 1, 6, 'شاشة Samsung 27 بوصة', 'SN-SM-27-9911', 'Samsung', 'S27A600', 'Active', 1400, '2025-03-15', '2028-03-15', 5, 70, 361.67, 1038.33, NULL),
 (5,  'AST-2026-00005', 1, 9,  2, 1, NULL, 'سيرفر Dell PowerEdge R750', 'SN-DL-SV-3320', 'Dell', 'PowerEdge R750', 'Active', 48000, '2024-08-01', '2029-08-01', 6, 4800, 15600.00, 32400.00, 'غرفة السيرفرات'),
 (6,  'AST-2026-00006', 1, 13, 1, 2, 7, 'مكتب خشبي تنفيذي', 'SN-FR-DK-101', 'OfficeMax', 'Executive-180', 'Active', 3200, '2023-05-10', NULL, 10, 160, 912.00, 2288.00, NULL),
 (7,  'AST-2026-00007', 1, 14, 1, 2, NULL, 'كرسي مكتبي أرجونومي', 'SN-FR-CH-220', 'Herman', 'ErgoPro', 'Damaged', 1800, '2023-05-10', NULL, 6, 90, 855.00, 945.00, 'مسند الظهر مكسور'),
 (8,  'AST-2026-00008', 1, 12, 3, 2, NULL, 'شقة سكنية 120م', 'RE-APT-1201', NULL, '3 غرف', 'Active', 450000, '2020-01-01', NULL, 30, 112500, 67500.00, 382500.00, 'سكن موظفين'),
 (9,  'AST-2026-00009', 1, 15, 1, 1, 2, 'سيارة تويوتا كامري 2024', 'VIN-TY-CM-8890', 'Toyota', 'Camry GLE', 'Active', 118000, '2024-02-01', '2029-02-01', 6, 17700, 41783.33, 76216.67, 'سيارة الإدارة'),
 (10, 'AST-2026-00010', 2, 10, 4, 3, 8, 'آلة تصنيع CNC', 'SN-CNC-5510', 'Haas', 'VF-4SS', 'Active', 780000, '2022-04-15', '2027-04-15', 12, 39000, 216125.00, 563875.00, 'خط الإنتاج الأول'),
 (11, 'AST-2026-00011', 2, 10, 4, 3, NULL, 'آلة تعبئة أوتوماتيك', 'SN-PK-2210', 'Bosch', 'AutoPack-500', 'UnderMaintenance', 320000, '2023-09-01', '2028-09-01', 12, 16000, 62000.00, 258000.00, 'يوجد عطل بالسير الناقل'),
 (12, 'AST-2026-00012', 2, 11, 5, 3, NULL, 'مولد كهرباء 500KVA', 'SN-GN-500-88', 'Caterpillar', 'DE500GC', 'Active', 265000, '2021-06-01', '2026-06-01', 15, 21200, 86520.00, 178480.00, 'مولد احتياطي'),
 (13, 'AST-2026-00013', 2, 6,  4, 3, 8, 'لابتوب Lenovo ThinkPad', 'SN-LN-TP-6612', 'Lenovo', 'ThinkPad T14', 'Active', 5800, '2025-01-10', '2028-01-10', 4, 580, 1697.50, 4102.50, 'عهدة مشرف الإنتاج'),
 (14, 'AST-2026-00014', 2, 8,  4, 3, NULL, 'شاشة صناعية مقاومة', 'SN-IND-MN-33', 'Advantech', 'IPPC-1501', 'Active', 8900, '2024-07-01', '2027-07-01', 5, 445, 3178.42, 5721.58, NULL),
 (15, 'AST-2026-00015', 3, 6,  6, 4, 9, 'ماك بوك برو 16', 'SN-APL-MBP-9901', 'Apple', 'MacBook Pro M3', 'Active', 14500, '2025-05-01', '2028-05-01', 4, 1450, 2718.75, 11781.25, 'عهدة قسم التطوير'),
 (16, 'AST-2026-00016', 3, 9,  6, 4, NULL, 'سيرفر HP ProLiant', 'SN-HP-SV-7712', 'HP', 'ProLiant DL380', 'Active', 39000, '2024-03-01', '2029-03-01', 6, 3900, 14137.50, 24862.50, NULL),
 (17, 'AST-2026-00017', 3, 7,  6, 4, NULL, 'طابعة ملونة Canon', 'SN-CN-PR-1120', 'Canon', 'imageRUNNER C3226', 'Active', 12000, '2024-09-15', '2027-09-15', 5, 600, 3306.00, 8694.00, NULL),
 (18, 'AST-2026-00018', 3, 13, 6, 2, 9, 'مكتب تطوير قابل للتعديل', 'SN-FR-ADJ-455', 'FlexiSpot', 'E7-Pro', 'Active', 4200, '2025-02-01', NULL, 10, 210, 698.25, 3501.75, NULL),
 (19, 'AST-2026-00019', 1, 6,  2, 1, NULL, 'لابتوب Asus قديم', 'SN-AS-OLD-2201', 'Asus', 'VivoBook 15', 'Disposed', 3100, '2019-04-01', NULL, 4, 310, 2790.00, 310.00, 'تم التكهين لانتهاء العمر الافتراضي'),
 (20, 'AST-2026-00020', 1, 7,  1, 1, NULL, 'طابعة صغيرة Brother', 'SN-BR-PR-3390', 'Brother', 'HL-L2350DW', 'Lost', 900, '2023-08-01', NULL, 5, 45, 470.25, 429.75, 'مفقودة — تحت التحقيق');

-- سجل العُهد
INSERT INTO custody_logs (asset_id, previous_user_id, new_user_id, action_type, acceptance_status, accepted_at, transfer_date, reason, assigned_by_user_id, created_at) VALUES
 (1, NULL, 6, 'Assign', 'Accepted', '2025-03-16 09:00:00', '2025-03-15 10:00:00', 'تسليم عهدة لابتوب للموظفة الجديدة', 1, '2025-03-15 10:00:00'),
 (2, NULL, 7, 'Assign', 'Accepted', '2025-06-02 11:00:00', '2025-06-01 09:30:00', 'تسليم عهدة لابتوب', 1, '2025-06-01 09:30:00'),
 (4, NULL, 6, 'Assign', 'Accepted', '2025-03-16 09:05:00', '2025-03-15 10:05:00', 'شاشة إضافية', 1, '2025-03-15 10:05:00'),
 (6, NULL, 7, 'Assign', 'Accepted', '2023-05-11 08:00:00', '2023-05-10 12:00:00', 'أثاث مكتب', 1, '2023-05-10 12:00:00'),
 (9, NULL, 2, 'Assign', 'Accepted', '2024-02-02 08:30:00', '2024-02-01 14:00:00', 'سيارة إدارية لمدير الشركة', 1, '2024-02-01 14:00:00'),
 (10, NULL, 8, 'Assign', 'Accepted', '2022-04-16 07:00:00', '2022-04-15 16:00:00', 'مسؤولية خط الإنتاج', 3, '2022-04-15 16:00:00'),
 (13, NULL, 8, 'Assign', 'Accepted', '2025-01-11 08:00:00', '2025-01-10 10:00:00', 'لابتوب عمل', 3, '2025-01-10 10:00:00'),
 (15, NULL, 9, 'Assign', 'Accepted', '2025-05-02 09:00:00', '2025-05-01 11:00:00', 'جهاز تطوير', 1, '2025-05-01 11:00:00'),
 (18, NULL, 9, 'Assign', 'Pending', NULL, NULL, 'مكتب جديد — بانتظار إقرار الاستلام', 1, '2026-08-10 09:00:00');

-- سجل المواقع
INSERT INTO location_logs (asset_id, previous_location_id, new_location_id, transfer_date, reason, moved_by_user_id, created_at) VALUES
 (5, 1, 2, '2024-08-05 10:00:00', 'نقل السيرفر لغرفة السيرفرات بالمستودع', 1, '2024-08-05 10:00:00'),
 (19, 1, 2, '2025-12-01 09:00:00', 'نقل للمستودع قبل التكهين', 1, '2025-12-01 09:00:00'),
 (11, 5, 4, '2026-01-15 08:00:00', 'نقل الآلة لمصنع 1 لأعمال الصيانة', 3, '2026-01-15 08:00:00');

-- التذاكر
INSERT INTO maintenance_tickets (id, ticket_number, asset_id, company_id, requester_user_id, assigned_technician_id, sla_policy_id, status, priority, source, issue_description, resolution_report, labor_cost, parts_cost, total_cost, created_at, assigned_at, first_response_at, resolved_at, closed_at, sla_response_due_at, sla_resolution_due_at, sla_breached) VALUES
 (1, 'TKT-2026-00001', 7,  1, 7, 4, 3, 'Closed',      'Medium',   'Manual', 'مسند ظهر الكرسي مكسور ولا يثبت', 'تم استبدال مسند الظهر بقطعة أصلية واختبار الكرسي', 150, 320, 470, '2026-06-01 09:00:00', '2026-06-01 10:00:00', '2026-06-01 10:30:00', '2026-06-02 14:00:00', '2026-06-03 09:00:00', '2026-06-01 17:00:00', '2026-06-04 09:00:00', 0),
 (2, 'TKT-2026-00002', 11, 2, 8, 5, 2, 'InProgress',  'High',     'QRScan', 'السير الناقل يتوقف فجأة أثناء التشغيل', NULL, 0, 0, 0, '2026-08-14 08:30:00', '2026-08-14 09:15:00', '2026-08-14 09:45:00', NULL, NULL, '2026-08-14 12:30:00', '2026-08-15 08:30:00', 0),
 (3, 'TKT-2026-00003', 3,  1, 6, NULL, 3, 'Open',      'Medium',   'Manual', 'الطابعة تسحب أكثر من ورقة في المرة الواحدة', NULL, 0, 0, 0, '2026-08-16 11:00:00', NULL, NULL, NULL, NULL, '2026-08-16 19:00:00', '2026-08-19 11:00:00', 0),
 (4, 'TKT-2026-00004', 1,  1, 6, 4, 4, 'Assigned',    'Low',      'Manual', 'طلب زيادة الذاكرة العشوائية للابتوب', NULL, 0, 0, 0, '2026-08-15 13:00:00', '2026-08-15 15:00:00', NULL, NULL, NULL, '2026-08-16 13:00:00', '2026-08-22 13:00:00', 0),
 (5, 'TKT-2026-00005', 12, 2, 8, 5, 1, 'WaitingParts','Critical', 'Manual', 'المولد لا يعمل عند انقطاع الكهرباء — توقف كامل للاحتياطي', NULL, 200, 0, 200, '2026-08-10 06:00:00', '2026-08-10 06:30:00', '2026-08-10 06:45:00', NULL, NULL, '2026-08-10 07:00:00', '2026-08-10 10:00:00', 1),
 (6, 'TKT-2026-00006', 15, 3, 9, 4, 3, 'Resolved',    'Medium',   'QRScan', 'شاشة الماك بوك تظهر خطوطاً عند الإقلاع', 'تم تحديث النظام وإعادة ضبط SMC — الشاشة تعمل بشكل طبيعي', 100, 0, 100, '2026-08-12 10:00:00', '2026-08-12 10:30:00', '2026-08-12 11:00:00', '2026-08-13 15:00:00', NULL, '2026-08-12 18:00:00', '2026-08-15 10:00:00', 0),
 (7, 'TKT-2026-00007', 20, 1, 6, NULL, 2, 'Cancelled', 'High',     'Manual', 'الطابعة الصغيرة غير موجودة بمكانها', NULL, 0, 0, 0, '2026-07-20 09:00:00', NULL, NULL, NULL, NULL, '2026-07-20 13:00:00', '2026-07-21 09:00:00', 1),
 (8, 'TKT-2026-00008', 10, 2, 8, 5, 2, 'Closed',      'High',     'Preventive', 'صيانة دورية لآلة CNC — تغيير الزيوت والفلاتر', 'تم تغيير الزيوت والفلاتر وفحص المحاور — الآلة بحالة جيدة', 400, 1250, 1650, '2026-05-01 08:00:00', '2026-05-01 08:30:00', '2026-05-01 09:00:00', '2026-05-01 16:00:00', '2026-05-02 09:00:00', '2026-05-01 12:00:00', '2026-05-02 08:00:00', 0);

-- تعليقات التذاكر
INSERT INTO ticket_comments (ticket_id, user_id, comment_text, is_internal, created_at) VALUES
 (1, 7, 'الكرسي أصبح غير آمن للاستخدام، أرجو السرعة', 0, '2026-06-01 09:05:00'),
 (1, 4, 'تم فحص الكرسي، سأطلب قطعة الغيار اليوم', 0, '2026-06-01 10:30:00'),
 (1, 4, 'ملاحظة داخلية: المورد لديه القطعة بالمخزن — لا حاجة لطلب خارجي', 1, '2026-06-01 10:35:00'),
 (2, 8, 'العطل يحدث كل 20 دقيقة تقريباً ويوقف الإنتاج', 0, '2026-08-14 08:45:00'),
 (2, 5, 'وصلت للموقع وبدأت الفحص — يبدو أن هناك مشكلة في حساس السرعة', 0, '2026-08-14 09:45:00'),
 (2, 5, 'داخلي: سأحتاج طلب حساس بديل من الشرق للمعدات', 1, '2026-08-14 10:00:00'),
 (5, 5, 'تم فحص المولد — عطل في مضخة الوقود ويحتاج قطعة مستوردة', 0, '2026-08-10 06:45:00'),
 (5, 3, 'الأمر عاجل جداً، نحتاج حلاً بديلاً مؤقتاً', 0, '2026-08-10 08:00:00'),
 (6, 9, 'شكراً، الجهاز يعمل بشكل ممتاز الآن', 0, '2026-08-13 16:00:00'),
 (8, 5, 'تمت الصيانة الوقائية حسب قائمة الفحص المعتمدة', 0, '2026-05-01 16:00:00');

-- قطع الغيار
INSERT INTO ticket_parts (ticket_id, part_name, quantity, unit_cost, total_cost, supplier_name) VALUES
 (1, 'مسند ظهر كرسي أرجونومي', 1, 320, 320, 'شركة الأثاث المكتبي'),
 (8, 'زيت هيدروليكي 20 لتر', 2, 350, 700, 'الشرق للمعدات الصناعية'),
 (8, 'فلتر هواء صناعي', 3, 120, 360, 'الشرق للمعدات الصناعية'),
 (8, 'فلتر زيت', 2, 95, 190, 'الشرق للمعدات الصناعية');

-- سجل التذاكر
INSERT INTO ticket_logs (ticket_id, action_user_id, action_type, old_value, new_value, notes, created_at) VALUES
 (1, 7, 'Created', NULL, 'Open', 'تم فتح التذكرة', '2026-06-01 09:00:00'),
 (1, 1, 'Assigned', 'Open', 'Assigned', 'تعيين الفني يوسف التميمي', '2026-06-01 10:00:00'),
 (1, 4, 'StatusChanged', 'Assigned', 'InProgress', 'بدء العمل', '2026-06-01 10:30:00'),
 (1, 4, 'StatusChanged', 'InProgress', 'Resolved', 'تم الإصلاح', '2026-06-02 14:00:00'),
 (1, 1, 'StatusChanged', 'Resolved', 'Closed', 'إغلاق التذكرة', '2026-06-03 09:00:00'),
 (2, 8, 'Created', NULL, 'Open', 'فتح عبر مسح QR', '2026-08-14 08:30:00'),
 (2, 3, 'Assigned', 'Open', 'Assigned', 'تعيين الفني راشد الدوسري', '2026-08-14 09:15:00'),
 (2, 5, 'StatusChanged', 'Assigned', 'InProgress', 'بدء الفحص', '2026-08-14 09:45:00'),
 (3, 6, 'Created', NULL, 'Open', 'تم فتح التذكرة', '2026-08-16 11:00:00'),
 (4, 6, 'Created', NULL, 'Open', 'تم فتح التذكرة', '2026-08-15 13:00:00'),
 (4, 1, 'Assigned', 'Open', 'Assigned', 'تعيين الفني', '2026-08-15 15:00:00'),
 (5, 8, 'Created', NULL, 'Open', 'تم فتح التذكرة', '2026-08-10 06:00:00'),
 (5, 3, 'Assigned', 'Open', 'Assigned', 'تعيين عاجل', '2026-08-10 06:30:00'),
 (5, 5, 'StatusChanged', 'Assigned', 'WaitingParts', 'بانتظار مضخة وقود', '2026-08-10 09:00:00'),
 (5, 1, 'Escalated', '0', '1', 'تجاوز زمن الحل المستهدف (SLA)', '2026-08-10 10:30:00'),
 (6, 9, 'Created', NULL, 'Open', 'فتح عبر مسح QR', '2026-08-12 10:00:00'),
 (6, 1, 'Assigned', 'Open', 'Assigned', 'تعيين الفني', '2026-08-12 10:30:00'),
 (6, 4, 'StatusChanged', 'InProgress', 'Resolved', 'تم الحل', '2026-08-13 15:00:00'),
 (8, 5, 'StatusChanged', 'InProgress', 'Resolved', 'انتهاء الصيانة الوقائية', '2026-05-01 16:00:00');

-- جداول الصيانة الوقائية
INSERT INTO maintenance_schedules (id, asset_id, title, recurrence_type, next_due_date, checklist_json, is_active) VALUES
 (1, 10, 'صيانة دورية آلة CNC', 'Quarterly', '2026-08-25', '["تغيير الزيوت","فحص المحاور","تنظيف الفلاتر","معايرة الدقة"]', 1),
 (2, 12, 'صيانة مولد الكهرباء', 'Monthly', '2026-08-20', '["تشغيل تجريبي 30 دقيقة","فحص مستوى الوقود","فحص البطارية","تنظيف الرادياتير"]', 1),
 (3, 5,  'صيانة سيرفر PowerEdge', 'SemiAnnual', '2026-09-15', '["تنظيف المراوح","فحص الأقراص RAID","تحديث Firmware","اختبار النسخ الاحتياطي"]', 1),
 (4, 11, 'صيانة آلة التعبئة', 'Quarterly', '2026-09-01', '["فحص السير الناقل","تشحيم المحامل","فحص الحساسات"]', 1),
 (5, 9,  'صيانة السيارة الإدارية', 'SemiAnnual', '2026-09-10', '["تغيير الزيت","فحص الفرامل","فحص الإطارات"]', 1),
 (6, 16, 'صيانة سيرفر ProLiant', 'Annual', '2027-03-01', '["تنظيف داخلي","فحص مزود الطاقة","تحديث النظام"]', 1);

-- قيود الإهلاك (آخر 3 أشهر لبعض الأصول)
INSERT INTO depreciation_entries (asset_id, period_date, amount, book_value_after, method) VALUES
 (1, '2026-06-30', 121.88, 5525.00, 'StraightLine'),
 (1, '2026-07-31', 121.88, 5403.12, 'StraightLine'),
 (1, '2026-08-31', 121.87, 5281.25, 'StraightLine'),
 (5, '2026-06-30', 600.00, 33600.00, 'StraightLine'),
 (5, '2026-07-31', 600.00, 33000.00, 'StraightLine'),
 (5, '2026-08-31', 600.00, 32400.00, 'StraightLine'),
 (10, '2026-06-30', 5145.83, 574166.66, 'StraightLine'),
 (10, '2026-07-31', 5145.83, 569020.83, 'StraightLine'),
 (10, '2026-08-31', 5145.83, 563875.00, 'StraightLine'),
 (15, '2026-07-31', 271.88, 12053.13, 'StraightLine'),
 (15, '2026-08-31', 271.88, 11781.25, 'StraightLine');

-- جلسات الجرد
INSERT INTO inventory_audits (id, company_id, location_id, title, status, created_by_user_id, started_at, completed_at, created_at) VALUES
 (1, 1, 1, 'جرد المبنى الإداري — الربع الثالث 2026', 'Completed', 1, '2026-07-01 08:00:00', '2026-07-02 15:00:00', '2026-07-01 08:00:00'),
 (2, 2, 4, 'جرد مصنع الدمام 1 — أغسطس 2026', 'InProgress', 3, '2026-08-15 08:00:00', NULL, '2026-08-15 08:00:00'),
 (3, 1, 2, 'جرد مستودع الرياض — أغسطس 2026', 'Open', 1, NULL, NULL, '2026-08-16 09:00:00');

INSERT INTO inventory_audit_items (inventory_audit_id, asset_id, result, scanned_by_user_id, scanned_at, notes) VALUES
 (1, 1, 'Found', 4, '2026-07-01 09:00:00', NULL),
 (1, 2, 'Found', 4, '2026-07-01 09:10:00', NULL),
 (1, 3, 'Found', 4, '2026-07-01 09:20:00', NULL),
 (1, 4, 'Found', 4, '2026-07-01 09:25:00', NULL),
 (1, 6, 'Found', 4, '2026-07-01 09:40:00', NULL),
 (1, 7, 'Damaged', 4, '2026-07-01 09:50:00', 'الكرسي تالف — تم فتح تذكرة'),
 (1, 9, 'Found', 4, '2026-07-01 10:00:00', NULL),
 (1, 20, 'Missing', 4, '2026-07-01 10:20:00', 'لم يتم العثور على الطابعة'),
 (2, 10, 'Found', 5, '2026-08-15 09:00:00', NULL),
 (2, 11, 'Found', 5, '2026-08-15 09:15:00', 'تحت الصيانة بالموقع'),
 (2, 13, 'Found', 5, '2026-08-15 09:30:00', NULL),
 (2, 14, 'Expected', NULL, NULL, NULL),
 (3, 5,  'Expected', NULL, NULL, NULL),
 (3, 19, 'Expected', NULL, NULL, NULL);

-- الإشعارات
INSERT INTO notifications (user_id, title, message, type, target_url, is_read, created_at) VALUES
 (4, 'تذكرة جديدة مسندة إليك', 'التذكرة TKT-2026-00004 — طلب زيادة الذاكرة العشوائية', 'Ticket', '#/tickets/4', 0, '2026-08-15 15:00:00'),
 (5, 'تذكرة حرجة مسندة إليك', 'التذكرة TKT-2026-00005 — المولد لا يعمل', 'Ticket', '#/tickets/5', 1, '2026-08-10 06:30:00'),
 (5, 'تجاوز SLA', 'التذكرة TKT-2026-00005 تجاوزت زمن الحل المستهدف', 'SLA', '#/tickets/5', 0, '2026-08-10 10:30:00'),
 (6, 'تحديث على تذكرتك', 'التذكرة TKT-2026-00004 تم تعيين فني لها', 'Ticket', '#/tickets/4', 0, '2026-08-15 15:01:00'),
 (9, 'إقرار استلام عهدة', 'لديك عهدة بانتظار الإقرار: مكتب تطوير قابل للتعديل', 'Custody', '#/custody', 0, '2026-08-10 09:00:00'),
 (9, 'تم حل تذكرتك', 'التذكرة TKT-2026-00006 تم حلها بنجاح', 'Ticket', '#/tickets/6', 1, '2026-08-13 15:00:00'),
 (1, 'انتهاء ضمان قريب', 'ضمان الأصل AST-2026-00012 (مولد كهرباء) ينتهي قريباً', 'Warranty', '#/assets/12', 0, '2026-08-01 08:00:00'),
 (1, 'صيانة وقائية مستحقة', 'صيانة مولد الكهرباء مستحقة بتاريخ 2026-08-20', 'System', '#/schedules', 0, '2026-08-16 07:00:00');

-- سجل التدقيق
INSERT INTO audit_logs (user_id, entity_name, entity_id, action, changes_json, ip_address, created_at) VALUES
 (1, 'Asset', '20', 'Update', '{"status":{"old":"Active","new":"Lost"}}', '10.0.0.5', '2026-07-20 09:30:00'),
 (1, 'Asset', '19', 'Update', '{"status":{"old":"Active","new":"Disposed"}}', '10.0.0.5', '2025-12-01 10:00:00'),
 (1, 'User', '9', 'Create', '{"full_name":"ليلى الأحمدي","role":"Employee"}', '10.0.0.5', '2026-01-15 08:00:00'),
 (3, 'Asset', '11', 'Update', '{"status":{"old":"Active","new":"UnderMaintenance"}}', '10.0.0.12', '2026-08-14 09:00:00'),
 (1, 'Company', '3', 'Create', '{"name":"شركة الأفق للتقنية"}', '10.0.0.5', '2025-11-01 09:00:00'),
 (1, 'Login', '1', 'Login', NULL, '10.0.0.5', '2026-08-17 07:00:00'),
 (4, 'Ticket', '1', 'Update', '{"status":{"old":"InProgress","new":"Resolved"}}', '10.0.0.22', '2026-06-02 14:00:00'),
 (1, 'Report', 'assets', 'Export', '{"format":"CSV","rows":20}', '10.0.0.5', '2026-08-16 12:00:00');

-- إعدادات النظام
INSERT INTO system_settings (setting_key, setting_value, description) VALUES
 ('company_group_name', 'مجموعة الشركات القابضة', 'اسم المجموعة الظاهر بالنظام'),
 ('asset_tag_prefix', 'AST', 'بادئة رقم الأصل'),
 ('ticket_prefix', 'TKT', 'بادئة رقم التذكرة'),
 ('depreciation_method', 'StraightLine', 'طريقة حساب الإهلاك'),
 ('default_page_size', '25', 'حجم الصفحة الافتراضي'),
 ('warranty_alert_days', '30', 'التنبيه قبل انتهاء الضمان بعدد أيام'),
 ('currency', 'ر.س', 'العملة');
