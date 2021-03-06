/*************************GO-LICENSE-START*********************************
 * Copyright 2015 ThoughtWorks, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *************************GO-LICENSE-END***********************************/

package com.thoughtworks.go.server.util;

import org.mortbay.util.UrlEncoded;

//Do not delete. Invoked using reflection
public class Jetty6ServletHelper extends ServletHelper {
    @Override
    public ServletRequest getRequest(javax.servlet.ServletRequest servletRequest) {
        return new Jetty6Request(servletRequest);
    }

    @Override
    public ServletResponse getResponse(javax.servlet.ServletResponse servletResponse) {
        return new Jetty6Response(servletResponse);
    }

    @Override
    public String encodeString(String string) {
        return UrlEncoded.encodeString(string);
    }

}

