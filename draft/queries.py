# Techships 
# queries

import cs304dbi as dbi

# ==========================================================
# The functions that do most of the work.


# assuming the form has a dropdown of companies and the value stored is the cid.
# if it's a text field, then change this to inner join company and modify query
def getByCompany(conn, cid):
    '''Returns the link, cid, uid, position, season, experience, city, state, and country
    of all applications (positions?) for a specified company, as a list of dictionaries.'''
    curs = dbi.dict_cursor(conn)
    curs.execute('''select * from application
    where cid = %s;''', [cid])
    return curs.fetchall()





if __name__ == '__main__':
    dbi.cache_cnf()   # defaults to ~/.my.cnf
    dbi.use('techship_db') 
    conn = dbi.connect()
    # use for testing once our tables are populated