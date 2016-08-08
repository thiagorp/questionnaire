SELECT name, age FROM users;

SELECT u.name, o.name FROM users u JOIN organizations o ON u.org_id = o.id;

SELECT o.id, u.name, u.age FROM (SELECT o.id org_id, MAX(u.age) age FROM organizations o JOIN users u ON u.org_id = o.id GROUP BY o.id) q JOIN organizations o ON o.id = q.org_id JOIN users u ON u.org_id = q.org_id AND u.age = q.age;

SELECT o.id, u.name, q.join_date FROM (SELECT o.id org_id, MAX(jsonb_extract_path_text(u.meta, 'joined')) join_date FROM organizations o JOIN users u ON u.org_id = o.id GROUP BY o.id) q JOIN organizations o ON o.id = q.org_id JOIN users u ON u.org_id = q.org_id AND jsonb_extract_path_text(u.meta, 'joined') = q.join_date;

SELECT name, jsonb_extract_path_text(meta, 'comment') FROM users;
