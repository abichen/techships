# Techships 
# queries

import cs304dbi as dbi

uid = "testuser" #for now, until we implement logins

# ==========================================================
# The functions that do most of the work.


# assuming the form has a dropdown of companies and the value stored is the cid.
# if it's a text field, then change this to inner join company and modify query
def getInternships(conn):
    '''Returns all internship application information'''
    curs = dbi.dict_cursor(conn)
    curs.execute('''select * from application''')
    return curs.fetchall()

def getByCompany(conn, compName):
    '''Returns the link, cid, uid, role, season, experience, city, state, and country
    of all applications for a specified company, as a list of dictionaries.'''
    curs = dbi.dict_cursor(conn)
    curs.execute('''select * from application
    where compName = %s;''', [compName])
    return curs.fetchall()


def getByRole(conn, role):
    '''Returns the link, cid, uid, role, season, experience, city, state, and country
    of all applications for a specified role, as a list of dictionaries.'''
    curs = dbi.dict_cursor(conn)
    curs.execute('''select * from application
    where role = %s;''', [role])
    return curs.fetchall()

def getByExperience(conn, exp):
    '''Returns the link, cid, uid, role, season, experience, city, state, and country
    of all applications needing specified experience/year, as a list of dictionaries.'''
    curs = dbi.dict_cursor(conn)
    curs.execute('''select * from application
    where experience FIND_IN_SET ('value', %s);''', [exp])
    return curs.fetchall()

def insertCompany(compName):
    conn = dbi.connect()
    curs = dbi.cursor(conn)
    curs.execute('''INSERT INTO company(compName) 
                values (%s);''', [compName])
    conn.commit()

def insertApplication(link,compName,role,season,year,experience): #add uid to this once we implement login
    '''Given the link, compName, role, season, yr, experience, inserts an
    application into the database.'''
    conn = dbi.connect()
    curs = dbi.cursor(conn)
    curs.execute('''INSERT INTO application(link,compName, uid, role,season,yr,experience) 
                values (%s, %s, %s, %s, %s, %s, %s);''', [link, compName, uid, role, season, 
                year, experience])
    conn.commit()

if __name__ == '__main__':
    dbi.cache_cnf()   # defaults to ~/.my.cnf
    dbi.use('techship_db') 
    conn = dbi.connect()
    print("By Company:")
    print(getByCompany(conn,"Google"))
    print("By Role:")
    print(getByRole(conn,"Software Engineering"))
    print("By Experience:")
    # print(getByExperience(conn, "Senior"))
    # insertApplication("http://www.test.com","test","Data Science","Fall","2022","Freshman")
    # insertCompany("test2")
    # insertApplication("http://www.test2.com","test2","Data Science","Spring","2023","Freshman")
    # use for testing once our tables are populated