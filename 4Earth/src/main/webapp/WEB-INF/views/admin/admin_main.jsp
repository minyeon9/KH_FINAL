<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

<%@ include file="/WEB-INF/views/common/admin_header.jsp" %>

        <div class="container">
            <div class="contents">
                <div class="side-bar is-open">
                    <button class="btn toggle-nav">
                        <i class="material-icons md-24">last_page</i>
                    </button>
                    <ul>
                        <li>
                            <a href="">
                                <i class="material-icons md-16"></i>
                                <span></span>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="material-icons md-16"></i>
                                <span></span>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="material-icons md-16"></i>
                                <span></span>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="material-icons md-16"></i>
                                <span></span>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="material-icons md-16"></i>
                                <span></span>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="material-icons md-16"></i>
                                <span></span>
                            </a>
                        </li>
                    </ul>
                </div>
                
                <section class="content-wrap">
                    <div class="page-tit">
                        <h3>ADMIN MAIN</h3>
                        <div class="bread-crumb">
                            <a href="../index.html"><i class="material-icons md-16">home</i></a>
                            <span>ADMIN MAIN</span>
                        </div>
                    </div>

                    <div class="guide">
                        <div class="admin-category">
                            <ul>
                                <li><a href='admin_notice.html'><i class="material-icons md-36">assignment</i>게시판</a></li>
                                <li ><a href='admin_m_list.html'><i class="material-icons md-36">person</i>회원</a></li>
                                <li><a href="admin_helpboard.html"><i class="material-icons md-36">live_help</i>문의</a></li>
                                <li><a href="admin_report_list.html"><i class="material-icons md-36">report_problem</i>신고</a></li>
                                <li><a href="#"><i class="material-icons md-36">checklist</i>챌린지</a></li>
                                <li><a href="admin_echo_list.html"><i class="material-icons md-36">storefront</i>에코샵</a></li>
                            </ul>
                        </div>
                        
                    </div> <!-- // guide -->
                    
            </section>

                <button class="btn scroll-top"><i class="material-icons md-24">vertical_align_top</i></button>
            </div>
        </div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script>
    $(() => {
        let sideBarMenu = $('.side-bar ul li');
        let menuPath = ['admin_notice.html','admin_m_list.html','admin_helpboard.html','admin_report_list.html','#','admin_echo_list.html'];
        let menuName = ['게시판', '회원', '문의', '신고', '챌린지', '에코샵'];
        let menuIcon = ['home', 'home', 'home', 'home', 'home', 'home'];

        for( let i = 0; i < menuName.length; i++ ) {
            let menuIdx = sideBarMenu.eq(i);

            menuIdx.find('a').attr('href', menuPath[i]);
            menuIdx.find('a > i').text(menuIcon[i]);
            menuIdx.find('a > span').text(menuName[i]);
        }

        sideBarMenu.each(function(idx, el) {
            if(idx == 1) {
                $(this).addClass('current');
            }
        });
    });

    var menu = document.getElementsByClassName("menu");

    function handleClick(event) {
        if (event.target.classList[1] === "clicked") {
            for (var i = 0; i < menu.length; i++) {
                menu[i].classList.remove("clicked");
                menu[i].classList.remove("clicked2");
            }

            event.target.classList.add("clicked2");
            event.target.value = "▲";
        } else if(event.target.classList[1] === "clicked2") {
            event.target.classList.remove("clicked");
            event.target.classList.remove("clicked2");

            event.target.value = "-";
        }else {
            if(event.target.classList[1] === "clicked2") {
                for (var i = 0; i < menu.length; i++) {
                menu[i].classList.remove("clicked2");
                menu[i].classList.remove("clicked");
            }
                event.target.classList.add("clicked2");
                event.target.value = "▲";
            }else {
                for (var i = 0; i < menu.length; i++) {
                menu[i].classList.remove("clicked");
                menu[i].classList.remove("clicked2");
            }
                event.target.classList.add("clicked");
                event.target.value = "▼";
            }
            
        }
    }

    function init() {
        for (var i = 0; i < menu.length; i++) {
            menu[i].addEventListener("click", handleClick);
        }
    }

    init();
</script>

</html>