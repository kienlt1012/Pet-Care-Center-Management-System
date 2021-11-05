<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<main id="main">

    <!-- ======= Breadcrumbs Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>Schedule</h2>
          <ol>
            <li><a href="">Schedule</a></li>
            <li>Schedule</li>
          </ol>
        </div>

      </div>
    </section><!-- Breadcrumbs Section -->

    <!-- ======= Schedule Details Section ======= -->
    <section class="tbl">
      <div class = "container">
        <table>
          <tr>
            <th class="day-name">Sun</th>
            <th class="day-name">Mon</th>
            <th class="day-name">Tue</th>
            <th class="day-name">Wed</th>
            <th class="day-name">Thu</th>
            <th class="day-name">Fri</th>
            <th class="day-name">Sat</th>
          </tr>
          <tr>
            <td class="day"><span class="number">31</span></td>
            <td class="day"><span class="number">1</span><span class="event"></span><span class="event"></span></td>
            <td class="day"><span class="number">2</span></td>
            <td class="day"><span class="number">3</span><span class="event event-multiday-start"></span></td>
            <td class="day"><span class="number">4</span><span class="event event-multiday"></span><span class="event event-multiday-start eventclass" style="background-color:#5a9ab2;"></span><span class="event"></td>
            <td class="day"><span class="number">5</span><span class="event event-multiday-finish"></span><span class="event event-multiday eventclass" style="background-color:#5a9ab2;"></span></td>
            <td class="day"><span class="number">6</span><span class="event event-ghost"></span><span class="event event-multiday-finish eventclass" style="background-color:#5a9ab2;"></span></td>
          </tr>
          <tr>
            <td class="day"><span class="number">7</span></td>
            <td class="day"><span class="number">8</span><span class="event"></span></td>
            <td class="day"><span class="number">9</span></td>
            <td class="day"><span class="number">10</span></td>
            <td class="day"><span class="number">11</span></td>
            <td class="day"><span class="number">12</span></td>
            <td class="day"><span class="number">13</span></td>
          </tr>
          <tr>
            <td class="day"><span class="number">14</span></td>
            <td class="day"><span class="number">15</span></td>
            <td class="day"><span class="number">16</span><span class="event"></span></td>
            <td class="day"><span class="number">17</span><span class="event"></span></td>
            <td class="day"><span class="number">18</span></td>
            <td class="day"><span class="number">19</span></td>
            <td class="day"><span class="number">20</span></td>
          </tr>
          <tr>
            <td class="day"><span class="number">21</span></td>
            <td class="day"><span class="number">22</span></td>
            <td class="day"><span class="number">23</span></td>
            <td class="day"><span class="number">24</span></td>
            <td class="day"><span class="number">25</span></td>
            <td class="day"><span class="number">26</span></td>
            <td class="day"><span class="number">27</span><span class="event event-multiday-start" style="background-color:#da5f5f;"></td>
          </tr>
          <tr>
            <td class="day"><span class="number">28</span><span class="event event-multiday" style="background-color:#da5f5f;"></td>
            <td class="day today"><span class="number">29</span><span class="event event-multiday-finish" style="background-color:#da5f5f;"></td>
            <td class="day"><span class="number">30</span></td>
            <td class="day"><span class="number">1</span></td>
            <td class="day"><span class="number">2</span></td>
            <td class="day"><span class="number">3</span></td>
            <td class="day"><span class="number">4</span></td>
          </tr>
          <tr>
            <td class="day"><span class="number">5</span></td>
            <td class="day"><span class="number">6</span><span class="event"></span></td>
            <td class="day"><span class="number">7</span></td>
            <td class="day"><span class="number">8</span></td>
            <td class="day"><span class="number">9</span></td>
            <td class="day"><span class="number">10</span></td>
            <td class="day"><span class="number">11</span></td>
          </tr>
        </table>
        <br><br>
        <p>The number of day-off:  /14</p>
      </div>
      
    </section><!-- End Schedule Details Section -->

  </main><!-- End #main -->
</body>
</html>