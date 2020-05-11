package com.androidbook.triviaquizserver;

import com.google.appengine.tools.development.testing.LocalDatastoreServiceTestConfig;
import com.google.appengine.tools.development.testing.LocalServiceTestHelper;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static org.mockito.Mockito.*;

/**
 * Created for trivia-quiz-server on 10/05/2020.
 *
 * @author Cesardl
 */
public class PlayerImageServletTest {

    private final LocalServiceTestHelper helper =
            new LocalServiceTestHelper(new LocalDatastoreServiceTestConfig());

    private HttpServletRequest mockRequest;
    private HttpServletResponse mockResponse;
    private PlayerImageServlet servletUnderTest;

    @Before
    public void setUp() {
        helper.setUp();

        mockRequest = mock(HttpServletRequest.class);
        mockResponse = mock(HttpServletResponse.class);

        servletUnderTest = new PlayerImageServlet();
    }

    @After
    public void tearDown() {
        helper.tearDown();
    }

    @Test
    public void doGetPlayerNotFound() throws ServletException, IOException {
        when(mockRequest.getParameter("key")).thenReturn("1000000000000000");

        servletUnderTest.doGet(mockRequest, mockResponse);

        verify(mockResponse, never()).getOutputStream();
        verify(mockResponse, never()).flushBuffer();
    }
}
