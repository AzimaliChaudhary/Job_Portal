<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMaster.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="jobportal.user.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
/* Style for each news item container */
.news-item {
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 10px;
    margin-bottom: 20px;
    background-color: #f9f9f9;
    display: flex; /* Use flexbox for layout */
}

/* Style for news image */
.news-image {
    width: auto;
    max-height: 170px; /* Increase the maximum height as needed */
    display: block;
    margin-right: 20px; /* Add space between image and title */
}

/* Style for news details container */
.news-details {
    flex-grow: 1; /* Allow details to grow and fill remaining space */
}

/* Style for news title */
.news-title {
     color: #333;
    font-size: 18px;
    font-weight: bold; /* Add bold font weight */
    text-decoration: none;
    margin-bottom: 5px;
}

/* Style for news description */
.news-description {
    color: #666;
    font-size: 16px;
    line-height: 1.5;
    margin: 0;
}
.news-image {
    width: 300px; /* Adjust this value as needed */
    height: 300px; /* Adjust this value as needed */
    object-fit: cover; /* This ensures the image fills the specified dimensions */
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


 <main>

        <!-- Hero Area Start-->
        <div class="slider-area ">
        <div class="single-slider section-overly slider-height2 d-flex align-items-center" data-background="../assets/img/hero/about.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>About us</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <!-- Hero Area End -->
        <!-- Support Company Start-->
        <%--<div class="support-company-area fix section-padding2">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-xl-6 col-lg-6">
                        <div class="right-caption">
                            <!-- Section Tittle -->
                            <div class="section-tittle section-tittle2">
                                <span>What we are doing</span>
                                <h2>24k Talented people are getting Jobs</h2>
                            </div>
                            <div class="support-caption">
                                <p class="pera-top">Mollit anim laborum duis au dolor in voluptate velit ess cillum dolore eu lore dsu quality mollit anim laborumuis au dolor in voluptate velit cillum.</p>
                                <p>Mollit anim laborum.Duis aute irufg dhjkolohr in re voluptate velit esscillumlore eu quife nrulla parihatur. Excghcepteur signjnt occa cupidatat non inulpadeserunt mollit aboru. temnthp incididbnt ut labore mollit anim laborum suis aute.</p>
                                <a href="../user/Login.aspx" class="btn post-btn">Post a job</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6">
                        <div class="support-location-img">
                            <img src="../assets/img/service/support-img.jpg" alt="">
                            <div class="support-img-cap text-center">
                                <p>Since</p>
                                <span>1994</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>--%>

        <div class="support-company-area support-padding fix">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-xl-6 col-lg-6">
                        <div class="right-caption">
                            <!-- Section Tittle -->
                            <div class="section-tittle section-tittle2">
                                <span>What we are doing</span>
                                <h2><%--24k Talented people are getting Jobs--%>Welcome to Job Flnder, where talent meets opportunity.</h2>
                            </div>
                            <div class="support-caption">
                                <p class="pera-top"><%--Mollit anim laborum duis au dolor in voluptate velit ess cillum dolore eu lore dsu quality mollit anim laborumuis au dolor in voluptate velit cillum.--%>At [Job Flender], we believe that finding the right job should be accessible, efficient, and rewarding. Whether you're a seasoned professional looking to advance your career or a recent graduate eager to embark on your professional journey, we're here to help you every step of the way.</p>
                                <p><%--Mollit anim laborum.Duis aute irufg dhjkolohr in re voluptate velit esscillumlore eu quife nrulla parihatur. Excghcepteur signjnt occa cupidatat non inulpadeserunt mollit aboru. temnthp incididbnt ut labore mollit anim laborum suis aute.--%>Our platform connects talented individuals with a diverse range of job opportunities across various industries and sectors. From entry-level positions to executive roles, we strive to cater to the needs and aspirations of all job seekers.</p>
                                
                                <%--<a href="About.aspx" class="btn post-btn">Post a job</a>--%>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6">
                        <div class="support-location-img">
                            <img src="../assets/img/service/support-img.jpg" alt="">
                            <%--<div class="support-img-cap text-center">
                                <p>Since</p>
                                <span>1994</span>
                            </div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Support Company End-->
        <!-- How  Apply Process Start-->
        <div class="apply-process-area apply-bg pt-150 pb-150" data-background="../assets/img/gallery/how-applybg.png">
            <div class="container">
                <!-- Section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle white-text text-center">
                            <span>Apply process</span>
                            <h2> How it works</h2>
                        </div>
                    </div>
                </div>
                <!-- Apply Process Caption -->
                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="single-process text-center mb-30">
                            <div class="process-ion">
                                <span class="flaticon-search"></span>
                            </div>
                            <div class="process-cap">
                                <h5>1. Search a job</h5>
                            <p><%--Sorem spsum dolor sit amsectetur adipisclit, seddo eiusmod tempor incididunt ut laborea.--%>Browse through our extensive listings and filter by location, Job Type, and Posted Within to find the perfect job match.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-process text-center mb-30">
                            <div class="process-ion">
                                <span class="flaticon-curriculum-vitae"></span>
                            </div>
                            <div class="process-cap">
                                <h5>2. Apply for job</h5>
                            <p><%--Sorem spsum dolor sit amsectetur adipisclit, seddo eiusmod tempor incididunt ut laborea.--%>Submit your applications directly through our platform and take the first step towards your new career</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-process text-center mb-30">
                            <div class="process-ion">
                                <span class="flaticon-tour"></span>
                            </div>
                            <div class="process-cap">
                                <h5>3. Get your job</h5>
                            <p>communicate with the admin regarding job opportunities, qualifications, and application procedures.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- How  Apply Process End-->


         <!-- Blog Area Start -->
        <div class="home-blog-area blog-h-padding">
            <div class="container">
                <!-- Section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle text-center">
                            <span>Our latest blog</span>
                            <h2>Our recent news</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                  
                         
                        <asp:DataList ID="DataList1" runat="server">
    <ItemTemplate>
        <div class="news-item">
            <div class="a">
                <img src="<%# GetImageUrl(Eval("Image")) %>" alt="" class="news-image">
            </div>
            <div class="news-details">
                <div class="news-title">
                    <%# Eval("Title") %>
                </div>
                <p class="news-description">
                    <%# Eval("Description") %>
                </p>
            </div>
        </div>
        
    </ItemTemplate>
</asp:DataList>
                </div>
            </div>
        </div>
        <!-- Blog Area End -->



        <!-- Testimonial Start -->
        <div class="testimonial-area testimonial-padding">
            <div class="container">
                <!-- Testimonial contents -->
                <div class="row d-flex justify-content-center">
                    <div class="col-xl-8 col-lg-8 col-md-10">
                        <div class="h1-testimonial-active dot-style">
                            <!-- Single Testimonial -->
                            <div class="single-testimonial text-center">
                                <!-- Testimonial Content -->
                                <div class="testimonial-caption ">
                                    <!-- founder -->
                                    <div class="testimonial-founder  ">
                                        <div class="founder-img mb-30">
                                            <img src="../assets/img/testmonial/azim1.jpg" alt="" style="width: 130px; height: 132px; border-radius: 50%;">
                                            <span>Azim Chaudhary</span>
                                            <p>Creative Director</p>
                                        </div>
                                    </div>
                                    <div class="testimonial-top-cap">
                                        <p>"I'll lead a team in crafting captivating brand experiences tailored to our digital platform. My role involves defining the visual direction and brand identity, ensuring a cohesive and impactful online presence. Through innovation and collaboration, I'll inspire the team to create groundbreaking concepts that resonate with our audience, shaping the future of online job recruitment."</p>
                                    </div>
                                </div>
                            </div>
                            <!-- Single Testimonial -->
                            <div class="single-testimonial text-center">
                                <!-- Testimonial Content -->
                                <div class="testimonial-caption ">
                                    <!-- founder -->
                                    <div class="testimonial-founder  ">
                                        <div class="founder-img mb-30">
                                            <img src="../assets/img/testmonial/sadik2.jpg" alt="" style="width: 130px; height: 132px; border-radius: 50%;">
                                            <span>Sadik Khorajiya</span>
                                            <p>Creative Director</p>
                                        </div>
                                    </div>
                                    <div class="testimonial-top-cap">
                                        <p>"I'll lead a team in crafting captivating brand experiences tailored to our digital platform. My role involves defining the visual direction and brand identity, ensuring a cohesive and impactful online presence. Through innovation and collaboration, I'll inspire the team to create groundbreaking concepts that resonate with our audience, shaping the future of online job recruitment."</p>
                                    </div>
                                </div>
                            </div>
                            <!-- Single Testimonial -->
                           <%-- <div class="single-testimonial text-center">
                                <!-- Testimonial Content -->
                                <div class="testimonial-caption ">
                                    <!-- founder -->
                                    <div class="testimonial-founder  ">
                                        <div class="founder-img mb-30">
                                            <img src="../assets/img/testmonial/testimonial-founder.png" alt="">
                                            <span>Margaret Lawson</span>
                                            <p>Creative Director</p>
                                        </div>
                                    </div>
                                    <div class="testimonial-top-cap">
                                        <p>“I am at an age where I just want to be fit and healthy our bodies are our responsibility! So start caring for your body and it will care for you. Eat clean it will care for you and workout hard.”</p>
                                    </div>
                                </div>
                            </div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Testimonial End -->
        <!-- Online CV Area Start -->
        <div class="online-cv cv-bg section-overly pt-90 pb-120"  data-background="../assets/img/gallery/cv_bg.jpg">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-10">
                        <div class="cv-caption text-center">
                            <p class="pera1">FEATURED TOURS Packages</p>
                            <p class="pera2"> Make a Difference with Your Online Resume!</p>
                            <a href="#" class="border-btn2 border-btn4">Upload your cv</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Online CV Area End-->
    
       

    </main>
</asp:Content>
