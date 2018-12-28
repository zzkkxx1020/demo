package com.imooc.demo.web;

import com.imooc.demo.entity.Admin;
import com.imooc.demo.entity.Note;
import com.imooc.demo.service.AdminService;
import com.imooc.demo.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.ClassUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
public class AdminController {
    @Autowired
    private AdminService adminService;

    @Autowired
    private NoteService noteService;

    @RequestMapping(value = "/home",method = RequestMethod.GET)
    private String adminFreemarker(){
        return "index";
    }

    @RequestMapping(value = "/adminlogin",method = RequestMethod.POST)
    private String adminLogin(String adminName,String adminPwd,ModelMap modelMap){
        Admin admins = adminService.adminLogin(adminName);
        if (admins != null ){
            if (admins.getAdminPwd().equals(adminPwd)){
                List<Note> notes = noteService.getlistnote("java");
                modelMap.addAttribute("notes",notes);
                return "note_m";
            }
            modelMap.addAttribute("error","密码错误!");
            return "index";
        }
        modelMap.addAttribute("error","用户不存在!");
        return "index";
    }

    @RequestMapping(value = "/del",method = RequestMethod.GET)
    private String delNote(int id){
        int i = noteService.delNote(id);
        return "redirect:note/list";
    }
    @RequestMapping(value = "note/list",method = RequestMethod.GET)
    private String noteList(String noteType,ModelMap modelMap){
        List<Note> notes = noteService.getlistnote(noteType);
        modelMap.addAttribute("notes",notes);
        return "note_m";
    }
    @RequestMapping(value = "note/getById",method = RequestMethod.GET)
    private String getById(int id,ModelMap modelMap){
        Note notes = noteService.getByNoteId(id);
        modelMap.addAttribute("notes",notes);
        return "note_body";
    }

    @RequestMapping(value = "/add/note",method = RequestMethod.GET)
    private String add(){
        return "addNote";
    }

    @RequestMapping(value = "/add/note_body",method = RequestMethod.POST)
    @ResponseBody
    private int addNote(Note note,MultipartFile titleImg,ModelMap modelMap,HttpServletRequest request) throws IOException {
        MultipartHttpServletRequest mulRequest = (MultipartHttpServletRequest) request;
        MultipartFile file = mulRequest.getFile("titleImg");
        if (file!=null && file.getSize()>0) {
           // String realPath =request.getSession().getServletContext().getRealPath("upload/");
            String realPath = ClassUtils.getDefaultClassLoader().getResource("").getPath()+"static/";
            System.out.printf(realPath);
            File dir = new File(realPath);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            File destFile = new File(dir,file.getOriginalFilename());
            try {
                file.transferTo(destFile);
                note.setNoteTitleImg("static/"+file.getOriginalFilename());
                System.out.printf(note.getNoteTitleImg());
            } catch (IllegalStateException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        int addNote = noteService.addNote(note);
        System.out.print(addNote);
        return addNote;
    }
    @RequestMapping(value = "/update",method = RequestMethod.GET)
    private String updateById(int id,ModelMap modelMap){
        Note notes = noteService.getByNoteId(id);
        modelMap.addAttribute("notes",notes);
        return "updateNote";
    }
    @RequestMapping(value = "/updateBody",method = RequestMethod.POST)
    @ResponseBody
    private int updateBody(Note note,ModelMap modelMap){
        int updateBody = noteService.updateBody(note);
        return updateBody;
    }


}
