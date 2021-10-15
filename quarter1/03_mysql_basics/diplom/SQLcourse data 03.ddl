USE gb_curs_dnk;

select vi.* from gb_curs_dnk.v_issues as vi
 where vi.status = 'Новая';

select vals.* from gb_curs_dnk.v_core_list_values as vals;
