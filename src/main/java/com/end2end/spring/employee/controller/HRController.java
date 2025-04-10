package com.end2end.spring.employee.controller;

import com.end2end.spring.employee.dto.DepartmentDTO;
import com.end2end.spring.employee.dto.EmployeeDTO;
import com.end2end.spring.employee.dto.EmployeeDetailDTO;
import com.end2end.spring.employee.dto.JobDTO;
import com.end2end.spring.employee.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RequestMapping("/hr")
@Controller
public class HRController {

    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("/list")
    public String toList(Model model) {
        // TODO: 직원 관리 페이지로 이동
        List<EmployeeDTO> list = employeeService.selectAll();
        model.addAttribute("employeeList", list);
        model.addAttribute("isNoAuthExist", employeeService.isNoAuthExist());
        return "hr/hr-test";
    }

    @RequestMapping("/list/search")
    public String toListSearch(Model model) {
        // TODO: 해당 검색 결과를 list.jsp에 출력
        return "hr/list";
    }

    @RequestMapping("/chart")
    public String toChart(Model model) {
        // TODO: 직원 통계 페이지로 이동
        return "hr/chart";
    }

    @RequestMapping("/write")
    public String toWrite(Model model) {
        // TODO: 직원 추가 페이지로 이동
        List<DepartmentDTO> departmentList = employeeService. selectAllDepartment();
        List<JobDTO> jobList = employeeService.selectAllJob();

        model.addAttribute("departmentList", departmentList);
        model.addAttribute("jobList", jobList);

        return "hr/write";
    }

    @RequestMapping("/insert")
    public String insert(EmployeeDetailDTO dto, MultipartFile file) {
        // TODO: 직원 데이터 추가
        employeeService.insert(dto, file);
        return "redirect:/";
    }

    @RequestMapping("/roleUpdate/{id}")
    public String roleUpdate(@PathVariable("id") String id) {
        // TODO: 인사팀에서 승인하면 권한 추가
        employeeService.roleUpdate(id);
        return "redirect:/hr/list";
    }

    @RequestMapping("/idCheck")
    @ResponseBody
    public boolean idCheck(@RequestParam("loginId") String loginId) {
        // TODO: 아이디 중복 검사
        return employeeService.idVali(loginId);
    }

    @RequestMapping("/update")
    public String update(EmployeeDetailDTO dto) {
        // TODO: 직원 데이터 수정
       employeeService.update(dto);
        String employeeId = dto.getId();
        return "redirect:/mypage/"+employeeId;
    }

    @RequestMapping("/deleteById/{id}")
    public String deleteById(@PathVariable String id) {
        // TODO: 해당 id의 직원 데이터 삭제
        employeeService.deleteById(id);
        return "redirect:/hr/list";
    }
}
