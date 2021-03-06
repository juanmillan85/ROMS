/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.org.rbc1b.roms.security;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import static org.junit.Assert.assertEquals;
import org.junit.Before;
import org.junit.Test;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;

/**
 *
 * @author oliver.elder.esq
 */
public class RomsPermissionEvaluatorTest {
    //CHECKSTYLE:OFF

    private RomsPermissionEvaluator evaluator;
    private MockAuthentication authentication;

    @Before
    public void setUp() {
        evaluator = new RomsPermissionEvaluator();
        authentication = new MockAuthentication(1, "testname", "passwd");
        authentication.addAuthority("AuthA", "ApplicationA", 4, 5);
        authentication.addAuthority("AuthB", "ApplicationB", 2, 5);
        authentication.addAuthority("AuthC", "Applicationc", 3, 5);
    }

    @Test(expected = IllegalArgumentException.class)
    public void testInvalidPermission() {
        evaluator.hasPermission(authentication, "AuthC", "Invalid");
    }

    @Test
    public void testValidPermissionTargetNotFound() {
        assertEquals(false, evaluator.hasPermission(authentication, "AuthUnknown", "READ"));
    }

    @Test
    public void testValidPermissionDenied() {
        assertEquals(false, evaluator.hasPermission(authentication, "AuthB", "ADD"));
    }

    @Test
    public void testValidPermissionAllowed() {
        assertEquals(true, evaluator.hasPermission(authentication, "AuthC", "ADD"));
        assertEquals(true, evaluator.hasPermission(authentication, "AuthA", "ADD"));
    }

    private class MockAuthentication implements Authentication {

        private Map<String, ROMSGrantedAuthority> authorities = new HashMap<String, ROMSGrantedAuthority>();
        private Integer userId;
        private String password;
        private String userName;

        private MockAuthentication(Integer userId, String userName, String password) {
            this.userId = userId;
            this.userName = userName;
            this.password = password;
        }

        private void addAuthority(String code, String application, Integer departmentLevel, Integer nonDepartmentLevel) {
            ROMSGrantedAuthority authority = new ROMSGrantedAuthority();
            authority.setApplication(application);
            authority.setDepartmentLevelAccess(departmentLevel);
            authority.setNonDepartmentLevelAccess(nonDepartmentLevel);

            authorities.put(code, authority);
        }

        @Override
        public Collection<? extends GrantedAuthority> getAuthorities() {
            return this.authorities.values();
        }

        @Override
        public Object getCredentials() {
            throw new UnsupportedOperationException("Not supported yet.");
        }

        @Override
        public Object getDetails() {
            throw new UnsupportedOperationException("Not supported yet.");
        }

        @Override
        public Object getPrincipal() {
            return new ROMSUserDetails() {
                @Override
                public ROMSGrantedAuthority findAuthority(String application) {
                    return authorities.get(application);
                }

                @Override
                public Integer getUserId() {
                    return userId;
                }

                @Override
                public Collection<? extends GrantedAuthority> getAuthorities() {
                    throw new UnsupportedOperationException("Not supported yet.");
                }

                @Override
                public String getPassword() {
                    return password;
                }

                @Override
                public String getUsername() {
                    return userName;
                }

                @Override
                public boolean isAccountNonExpired() {
                    return true;
                }

                @Override
                public boolean isAccountNonLocked() {
                    return true;
                }

                @Override
                public boolean isCredentialsNonExpired() {
                    return true;
                }

                @Override
                public boolean isEnabled() {
                    return true;
                }
            };
        }

        @Override
        public boolean isAuthenticated() {
            return true;
        }

        @Override
        public void setAuthenticated(boolean isAuthenticated) throws IllegalArgumentException {
            // do nothing
        }

        @Override
        public String getName() {
            return userName;
        }
    }

    private class MockGrantedAuthority implements GrantedAuthority {

        private String authority;

        public MockGrantedAuthority(String authority) {
            this.authority = authority;
        }

        @Override
        public String getAuthority() {
            return this.authority;
        }
    }
}
